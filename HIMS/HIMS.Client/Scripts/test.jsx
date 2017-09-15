var TestMessage = React.createClass({
    handleDelete: function (e){
        this.props.deleteTest(this.props.testId);
    },
    rawMarkup: function() {
        var md = new Remarkable();
        var rawMarkup = md.render(this.props.children.toString());
        return { __html: rawMarkup };
    },
    render: function() {
      return (
        <tr className="testMsg">
          <td className="testId">
            {this.props.testId}
          </td>
          <td className="name">
            {this.props.name}
          </td>
          <td className="description">
            <span dangerouslySetInnerHTML={this.rawMarkup()} />
          </td>
          <td className="edit">
            <button className="btn btn btn-success">Edit</button>
          </td>
          <td className="delete col-md-4">
            <button onClick={this.handleDelete} className="btn btn-danger">Delete</button>
          </td>
        </tr>
      );
    }
});

var TestList = React.createClass({
    deleteTest: function(id) {
        $.ajax({
            headers: { 
                'Accept': 'application/json',
                'Content-Type': 'application/json' 
            },
            'type': 'POST',
            'url': this.props.submitUrl + 'test/deletetest',
            'data': JSON.stringify(id),
            'dataType': 'json',
            'success': null,
            xhrFields: {
                withCredentials: true
            },
            crossDomain: true
        });
    },
    render: function() {
        var testNodes = this.props.data.map(function(testMsg) {
            return (
                <TestMessage name={testMsg.Name} testId={testMsg.TestId}
                    key={testMsg.TestId}
                    deleteTest={this.deleteTest}>
                        {testMsg.Description}
                </TestMessage>
            );
        }, this);

        return (
            <table className="testList table table-striped">
                <thead>
					<tr>
                        <th>#</th>
						<th>Name</th>
						<th>Description</th>
                        <th></th>
                        <th></th>
					</tr>
				</thead>
                <tbody>
                    {testNodes}
                </tbody>
            </table>
        );
    }
});
  
var TestForm = React.createClass({
    getInitialState: function () {
        return { name: '', description: '' };
    },
    handleNameChange: function (e) {
        this.setState({ name: e.target.value });
    },
    handleDescriptionChange: function (e) {
        this.setState({ description: e.target.value });
    },
    handleSubmit: function(e) {
        e.preventDefault();
        var name = this.state.name.trim();
        var description = this.state.description.trim();
        if (!name || !description) {
          return;
        }
        this.props.handleTestSubmit({Name: name, Description: description});
        this.setState({name: '', description: ''});
    },
    render: function() {
      return (
        <div className="container-fluid">
            <div className="navbar-header">
                <div className="navbar-brand">Add a new test record: </div>
                <form onSubmit={this.handleSubmit} className="navbar-form navbar-right">
                    <div className="form-group row">
                        <input
                            id="NameField"
                            type="text"
                            placeholder="Name ..."
                            value={this.state.name}
                            onChange={this.handleNameChange}
                            className="form-control"
                        />
                    </div>
                    <div className="form-group">
                        <input
                            id="DescriptionField"
                            type="text"
                            placeholder="Description ..."
                            value={this.state.description}
                            onChange={this.handleDescriptionChange}
                            className="form-control"
                        />
                    </div>
                    <button type="submit" className="btn btn-primary">Add</button>
                </form>
            </div>
        </div>
      );
    }
});

var LogInBox = React.createClass({
    getInitialState: function () {
        return { email: '', password: '', hideLogin: false, successMsg: '' };
    },
    handleEmailChange: function (e) {
        this.setState({ email: e.target.value });
    },
    handlePasswordChange: function (e) {
        this.setState({ password: e.target.value });
    },
    handleLoginSubmit: function(loginModel) {
        $.ajax({
            headers: { 
                'Accept': 'application/json',
                'Content-Type': 'application/json' 
            },
            'type': 'POST',
            'url': this.props.submitUrl + 'account/login',
            'data': JSON.stringify(loginModel),
            'dataType': 'json',
            'success': this.loginCallback,
            xhrFields: {
                withCredentials: true
            },
            crossDomain: true
        });
    },
    loginCallback: function(e) {
        if (e == ' successful!')
            this.setState({ hideLogin: true });
        this.setState({ successMsg: e });
    },
    handleSubmit: function(e) {
        e.preventDefault();
        var email = this.state.email.trim();
        var password = this.state.password.trim();
        if (!email || !password) {
          return;
        }
        this.handleLoginSubmit({Email: email, Password: password});
        this.setState({email: '', password: ''});
    },
    render: function () {
        return (
                <nav className="navbar navbar-default">
                    <div className="container-fluid">
                        <div className="navbar-header">
                            <div className="navbar-brand">Login</div>
                            <form className="navbar-form navbar-right"
                                  onSubmit={this.handleSubmit}
                                  hidden={this.state.hideLogin}>
                                <div className="form-group">
                                    <input type="text"
                                        className="form-control"
                                        placeholder="username (email)"
                                        value={this.state.email}
                                        onChange={this.handleEmailChange}
                                     />
                                </div>
                                <div className="form-group">
                                    <input type="password"
                                        className="form-control"
                                        placeholder="password"
                                        value={this.state.password}
                                        onChange={this.handlePasswordChange}
                                    />
                                </div>
                                <button type="submit"
                                    className="btn btn-default" >
                                    Login
                                </button>
                            </form>
                            <div className="navbar-brand" hidden={!this.state.hideLogin}>{this.state.successMsg}</div>
                        </div>
                    </div>
                </nav>
            );
    }
});

var TestBox = React.createClass({
    getInitialState: function () {
        return { data: [] };
    },
    loadTestMsgFromServer: function () {
        var xhr = new XMLHttpRequest();
        xhr.open('get', this.props.url, true);
        xhr.withCredentials = true; 
        xhr.onload = function () {
            var data = JSON.parse(xhr.responseText);
            this.setState({ data: data });
        }.bind(this);
        xhr.send(null);
    },
    handleTestSubmit: function(testMsg) {
        $.ajax({
            headers: { 
                'Accept': 'application/json',
                'Content-Type': 'application/json' 
            },
            'type': 'POST',
            'url': this.props.submitUrl + 'test/addtest',
            'data': JSON.stringify(testMsg),
            'dataType': 'json',
            'success': null,
            xhrFields: {
                withCredentials: true
            },
            crossDomain: true
        });
    },
    componentDidMount: function () {
        this.loadTestMsgFromServer();
        window.setInterval(this.loadTestMsgFromServer, this.props.pollInterval);
    },
    render: function () {
        return (            
            <div className="testBox">
                <LogInBox submitUrl={this.props.submitUrl} />
                <TestList data={this.state.data} submitUrl={this.props.submitUrl} />
                <TestForm  handleTestSubmit={this.handleTestSubmit}/>
            </div>
        );
    }
});

ReactDOM.render(
    <TestBox url="http://localhost:22795/api/test/test"
             submitUrl="http://localhost:22795/api/"
             pollInterval={2000} />,
    document.getElementById('content')
);
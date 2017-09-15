using System.Web.Http;
using HIMS.BusinessLogic.Interfaces;
using Microsoft.Owin.Security;
using System.Web.Http.Owin;
using System.Web;
using System.Threading.Tasks;
using HIMS.WebAPI.Models;
using HIMS.BusinessLogic.DTO;
using System.Security.Claims;
using HIMS.BusinessLogic.Infrastructure;
using System.Collections.Generic;
using System.Web.Http.Cors;

namespace HIMS.WebAPI.Controllers
{
    [EnableCorsAttribute("http://localhost:22394", "*", "*", SupportsCredentials = true)]
    public class AccountController : ApiController
    {
        IUserService _userService;

        public AccountController(IUserService userService)
        {
            _userService = userService;
        }

        private IAuthenticationManager AuthenticationManager => HttpContext.Current.GetOwinContext().Authentication;

        [AllowAnonymous]
        [HttpPost]
        public async Task<IHttpActionResult> Login(LoginModel model)
        {
            await SetInitialDataAsync();
            if (ModelState.IsValid)
            {
                UserTransferModel userDto = new UserTransferModel { Email = model.Email, Password = model.Password };
                ClaimsIdentity claim = await _userService.Authenticate(userDto);
                if (claim == null)
                {
                    ModelState.AddModelError("", "Wrong login or password!");
                }
                else
                {
                    AuthenticationManager.SignOut();
                    AuthenticationManager.SignIn(new AuthenticationProperties
                    {
                        IsPersistent = true
                    }, claim);
                    return Ok(" successful!");
                }
            }
            return NotFound();
        }

        [Authorize]
        [HttpGet]
        public IHttpActionResult Logout()
        {
            AuthenticationManager.SignOut();
            return Ok("Logout successful");
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IHttpActionResult> Register(RegisterModel model)
        {
            await SetInitialDataAsync();
            if (ModelState.IsValid)
            {
                UserTransferModel userDto = new UserTransferModel
                {
                    Email = model.Email,
                    Password = model.Password,
                    Address = model.Address,
                    Name = model.Name,
                    Role = "user"
                };
                OperationDetails operationDetails = await _userService.Create(userDto);
                if (operationDetails.Succedeed)
                    return Ok("Register successful");
                else
                    ModelState.AddModelError(operationDetails.Property, operationDetails.Message);
            }
            return NotFound();
        }
        private async Task SetInitialDataAsync()
        {
            await _userService.SetInitialData(new UserTransferModel
            {
                Email = "alex.meleschenko@gmail.com",
                UserName = "Alex",
                Password = "admin123",
                Name = "Alexander Meleschenko",
                Address = "Minsk, The Repablic of Belarus",
                Role = "admin",
            }, new List<string> { "user", "mentor", "admin" });
        }
    }
}
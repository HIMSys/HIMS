﻿//------------------------------------------------------------------------------
// <auto-generated>This code was generated by LLBLGen Pro v5.2.</auto-generated>
//------------------------------------------------------------------------------
using System;
using System.ComponentModel;
using System.Runtime.Serialization;
using System.Xml.Serialization;
using System.Collections.Specialized;
using System.Collections.Generic;

namespace HIMS.Data.EntityClasses
{
	/// <summary>Class which represents the entity 'Test'.</summary>
	[Serializable]
	[DataContract(IsReference=true)]
	public partial class Test : CommonEntityBase
	{
		/// <summary>Initializes a new instance of the <see cref="Test"/> class.</summary>
		public Test() : base()
		{
		}

		#region Class Property Declarations
		/// <summary>Gets or sets the Description field. </summary>
		[DataMember]
		public System.String Description { get; set;}
		/// <summary>Gets or sets the Name field. </summary>
		[DataMember]
		public System.String Name { get; set;}
		/// <summary>Gets or sets the TestId field. </summary>
		[DataMember]
		public System.Int32 TestId { get; set;}
		#endregion
	}
}

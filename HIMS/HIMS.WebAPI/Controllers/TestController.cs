using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AutoMapper;
using HIMS.BusinessLogic.DTO;
using HIMS.BusinessLogic.Interfaces;
using HIMS.WebAPI.Models;

namespace HIMS.WebAPI.Controllers
{
    public class TestController : ApiController
    {
        ITestService _testService;

        public TestController(ITestService testService)
        {
            _testService = testService;
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public IHttpActionResult Test()
        {
            IEnumerable<TestTransferModel> testDtos = _testService.GetTests();
            Mapper.Initialize(cfg => cfg.CreateMap<TestTransferModel, TestViewModel>());
            var phones = Mapper.Map<IEnumerable<TestTransferModel>, List<TestViewModel>>(testDtos);
            return Ok(phones);
        }
    }
}

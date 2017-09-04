using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using HIMS.BusinessLogic.DTO;
using HIMS.BusinessLogic.Infrastructure;
using HIMS.Data.EntityClasses;
using HIMS.Data.Interfaces;
using HIMS.Interfaces.BusinessLogic;

namespace HIMS.BusinessLogic.Services
{
    class TestService : ITestService
    {
        IUnitOfWork Database { get; set; }

        public TestService(IUnitOfWork uow)
        {
            Database = uow;
        }
        public void SaveTest(TestTransferModel testDTO)
        {
            // Validation
            if (testDTO.Name.Length > 25)
                throw new ValidationException($"The length of {nameof(testDTO.Name)} must be less then 25"
                    , nameof(testDTO.Name));
            if (testDTO.Description.Length > 255)
                throw new ValidationException($"The length of {nameof(testDTO.Description)} must be less then 25"
                    , nameof(testDTO.Description));

            var test = new Test
            {
                Name = testDTO.Name,
                Description = testDTO.Description
            };

            Database.Tests.Create(test);
            Database.Save();
        }

        public IEnumerable<TestTransferModel> GetTests()
        {
            Mapper.Initialize(cfg => cfg.CreateMap<Test, TestTransferModel>());
            return Mapper.Map<IEnumerable<Test>, List<TestTransferModel>>(Database.Tests.GetAll());
        }

        public TestTransferModel GetTest(int? id)
        {
            if (!id.HasValue)
                throw new ValidationException("The Test's id value is not set", String.Empty);

            var test = Database.Tests.Get(id.Value);

            if (test == null)
                throw new ValidationException($"The Test with id = {id} was not found", String.Empty);

            Mapper.Initialize(cfg => cfg.CreateMap<Test, TestTransferModel>());
            return Mapper.Map<Test, TestTransferModel>(test);
        }

        public void Dispose()
        {
            Database.Dispose();
        }
    }
}

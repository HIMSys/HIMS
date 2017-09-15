using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HIMS.BusinessLogic.DTO;

namespace HIMS.BusinessLogic.Interfaces
{
    public interface ITestService
    {
        void SaveTest(TestTransferModel testTM);
        TestTransferModel GetTest(int? id);
        IEnumerable<TestTransferModel> GetTests();
        void DeleteTest(int? id);
        void Dispose();
    }
}

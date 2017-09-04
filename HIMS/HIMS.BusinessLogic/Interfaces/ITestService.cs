using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HIMS.BusinessLogic.DTO;

namespace HIMS.Interfaces.BusinessLogic
{
    public interface ITestService
    {
        void SaveTest(TestTransferModel testTM);
        TestTransferModel GetTest(int? id);
        IEnumerable<TestTransferModel> GetTests();
        void Dispose();
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HIMS.EntityClasses;

namespace HIMS.DAL.Interfaces
{
    public interface IUnitOfWork : IDisposable
    {
        IRepository<TestTable> Tests { get; }
        void Save();
    }
}

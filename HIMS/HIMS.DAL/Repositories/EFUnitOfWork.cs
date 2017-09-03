using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HIMS.DAL.Interfaces;
using HIMS.EntityClasses;

namespace HIMS.DAL.Repositories
{
    public class EFUnitOfWork : IUnitOfWork
    {
        private HIMSDataContext db;
        private TestRepository testRepository;

        public EFUnitOfWork(string connectionString)
        {
            db = new HIMSDataContext(connectionString);
        }
        public IRepository<TestTable> TestTables
        {
            get
            {
                if (testRepository == null)
                    testRepository = new TestRepository(db);
                return testRepository;
            }
        }

        public void Save()
        {
            db.SaveChanges();
        }

        private bool disposed = false;

        public virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    db.Dispose();
                }
                this.disposed = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}

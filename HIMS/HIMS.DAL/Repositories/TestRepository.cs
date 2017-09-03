using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HIMS.DAL.Interfaces;
using HIMS.EntityClasses;

namespace HIMS.DAL.Repositories
{
    public class TestRepository : IRepository<TestTable>
    {
        private HIMSDataContext db;

        public TestRepository(HIMSDataContext context)
        {
            this.db = context;
        }

        public IEnumerable<TestTable> GetAll()
        {
            return db.TestTables;
        }

        public TestTable Get(int id)
        {
            return db.TestTables.Find(id);
        }

        public void Create(TestTable testTable)
        {
            db.TestTables.Add(testTable);
        }

        public void Update(TestTable testTable)
        {
            db.Entry(testTable).State = EntityState.Modified;
        }

        public IEnumerable<TestTable> Find(Func<TestTable, Boolean> predicate)
        {
            return db.TestTables.Where(predicate).ToList();
        }

        public void Delete(int id)
        {
            TestTable testTable = db.TestTables.Find(id);
            if (testTable != null)
                db.TestTables.Remove(testTable);
        }
    }
}

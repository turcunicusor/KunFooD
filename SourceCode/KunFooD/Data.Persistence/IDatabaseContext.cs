using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Persistence
{
    public interface IDatabaseContext
    {
        int SaveChanges();
    }
}

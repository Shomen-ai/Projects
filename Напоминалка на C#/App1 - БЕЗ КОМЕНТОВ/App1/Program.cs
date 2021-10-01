using System; 
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms; 
using App1.Properties; 

namespace App1
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            
            DateTime date = Convert.ToDateTime(Settings.Default["Date_chosen"]);
            DateTime today = DateTime.Today;
            if (date == today)
            {
                MessageBox.Show("НАПОМИНАЮ ЧТО У ВАС ЗАПЛАНИРОВАННО СОБЫТИЕ","НАПОМИНАНИЕ", MessageBoxButtons.OK, MessageBoxIcon.Asterisk, MessageBoxDefaultButton.Button1, MessageBoxOptions.ServiceNotification);
                Settings.Default.Reset();
            }
            else if(date > today)
            {
            }
            else
            {
                Application.Run(new Form1());
            }
        }
    }
}

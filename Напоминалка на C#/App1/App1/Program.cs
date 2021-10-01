using System; // для работы с формами
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms; // для работы с формами
using App1.Properties; // чтобы достать выбранную дату из приложения

namespace App1
{
    static class Program
    {
        /// <summary>
        /// Главная точка входа для приложения.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles(); // включает визуальный стили приложения
            Application.SetCompatibleTextRenderingDefault(false); //для того, чтобы использовать для отрисовки текста класс TextRenderer
            
            DateTime date = Convert.ToDateTime(Settings.Default["Date_chosen"]); // берём из памяти приложения выбранную дату и конвертируем её
                                                                        // при помощи метода класса  Convert.ToDateTime() из object в DateTime
            DateTime today = DateTime.Today; // используя свойства структуры, получаем сегодняшную дату
            if (date == today) // если даты равны, то выводоим напоминание
            {
                MessageBox.Show("НАПОМИНАЮ ЧТО У ВАС ЗАПЛАНИРОВАННО СОБЫТИЕ","НАПОМИНАНИЕ", MessageBoxButtons.OK, MessageBoxIcon.Asterisk, MessageBoxDefaultButton.Button1, MessageBoxOptions.ServiceNotification);
                // первый аргумент сообщение, второй название окна, третий какая кнопка, четвёртый картинка, определем кнопку, окно сооющения
                Settings.Default.Reset(); // Удаляем данные из памяти приложения
            }
            else if(date > today)
            {
                // если выбранная дата больше, чем сегодняшняя, то ничего не делаем
            }
            else // запуск приложения
            {
                Application.Run(new Form1());
            }
        }
    }
}

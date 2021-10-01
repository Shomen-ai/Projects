using System; // для работы с формами
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms; // для работы с формами
using Microsoft.Win32; // для записи в реестр
using App1.Properties; // для записис впараметры приложения даты
using System.Reflection; // для получения пути к фалу 

namespace App1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent(); // метод требуемый для конструктора
        }

        // Форма1
        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        // CheckBox
        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked == true) // Если автозагрузка нужна
            {
                SetAutoRunValue(true, Assembly.GetExecutingAssembly().Location); // Assembly.GetExecutingAssembly().Location позволяет получить путь до нашего приложения
            }
            else // Если автозагрузка не нужна
            {
                SetAutoRunValue(false, Assembly.GetExecutingAssembly().Location);
            }
        }

        // label1 " Напоминалочка "
        private void label1_Click(object sender, EventArgs e)
        {

        }
        
        // label 4 Для нормального отображения даты
        private void label4_Click(object sender, EventArgs e)
                {

                }

        // кнопка закрыть
        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        // dateTimePicker1 
        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            label3.Text = "Вы выбрали: " + dateTimePicker1.Value.Date.ToString(); // вывожу выбранную дату в отдельный label3
        }

        // кнопка Сохранить
        private void button1_Click(object sender, EventArgs e)
        {
            if (dateTimePicker1.Value.Date < DateTime.Today) // если дата выбрана из прошлого
            {
                MessageBox.Show("Выберите дату не из прошлого! Мы не в фильме Назад в прошлое "); // выводим окно-сообщение
            }
            else if (label3.Text != "  ") // если label3 не пустой, то сохраняем, если нет, то просим выбрат дату
            {
                Settings.Default["Date_chosen"] = dateTimePicker1.Value.Date; // записываем данные в приложение
                Settings.Default.Save(); // сохраняем данные в приложении
                MessageBox.Show("Данные сохранены!"); // выводим окно-сообщение
            }
            else // если ничего не введено
            {
                MessageBox.Show("Выберите дату!"); // выводим окно-сообщение
            }
        }

        // функция для добавления в реестр автозапуска
        // переменная autorun отвечает за то, нужна ли функция автозапуска
        // path - это путь нашего приложения
        private bool SetAutoRunValue(bool autorun, string path)
        {
            const string name = "app1"; // присваем будущее имя нашему процессу в реестре автозагрузок
            string ExePath = path; // присваиваем путь
            RegistryKey reg; // создаём переменную reg класса RegistryKey для работы с этим классом
            reg = Registry.CurrentUser.CreateSubKey("Software\\Microsoft\\Windows\\CurrentVersion\\Run\\");
            // создаём вложенный ключ
            // try/catch для того тобы словить Exception
            try
            {
                if (autorun) // если автозагрузка нужна,то устанавливаем значния ключа: его имя и путь к нашему приложению
                {
                    reg.SetValue(name, ExePath);
                }
                else // если не надо, то просто удаляем вложенный ключ
                {
                    reg.DeleteValue(name);
                }

                reg.Flush(); // записываем в реестр все атрибуты заданного открытого раздела реестра
                reg.Close(); // если содержимое было изменено, закрываем его и записываем на диск
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }
}

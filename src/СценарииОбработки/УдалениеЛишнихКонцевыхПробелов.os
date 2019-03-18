///////////////////////////////////////////////////////////////////////////////
// 
// Служебный модуль с реализацией сценариев обработки файлов <УдалениеЛишнихКонцевыхПробелов>
//
///////////////////////////////////////////////////////////////////////////////

// ИмяСценария
//	Возвращает имя сценария обработки файлов
//
// Возвращаемое значение:
//   Строка   - Имя текущего сценария обработки файлов
//
Функция ИмяСценария() Экспорт
	
	Возврат "УдалениеЛишнихКонцевыхПробелов";

КонецФункции // ИмяСценария()

// ОбработатьФайл
//	Выполняет обработку файла
//
// Параметры:
//  АнализируемыйФайл		- Файл - Файл из журнала git для анализа
//  КаталогИсходныхФайлов  	- Строка - Каталог расположения исходных файлов относительно каталог репозитория
//  ДополнительныеПараметры - Структура - Набор дополнительных параметров, которые можно использовать 
//  	* Лог  					- Объект - Текущий лог
//  	* ИзмененныеКаталоги	- Массив - Каталоги, которые необходимо добавить в индекс
//		* КаталогРепозитория	- Строка - Адрес каталога репозитория
//		* ФайлыДляПостОбработки	- Массив - Файлы, изменившиеся / образоавшиеся в результате работы сценария
//											и которые необходимо дообработать
//
// Возвращаемое значение:
//   Булево   - Признак выполненной обработки файла
//
Функция ОбработатьФайл(АнализируемыйФайл, КаталогИсходныхФайлов, ДополнительныеПараметры) Экспорт
	
	Лог = ДополнительныеПараметры.Лог;
	НастройкиСценария = ДополнительныеПараметры.УправлениеНастройками.Настройка("Precommt4onecСценарии\НастройкиСценариев").Получить(ИмяСценария());
	Если АнализируемыйФайл.Существует() И ТипыФайлов.ЭтоФайлИсходников(АнализируемыйФайл) Тогда
		
		Лог.Информация("Обработка файла '%1' по сценарию '%2'", АнализируемыйФайл.ПолноеИмя, ИмяСценария());
		
		Если ИсправитьКонцевыеПробелы(АнализируемыйФайл.ПолноеИмя) Тогда

			ДополнительныеПараметры.ИзмененныеКаталоги.Добавить(АнализируемыйФайл.ПолноеИмя);

		КонецЕсли;

		Возврат Истина;
		
	КонецЕсли;
	
	Возврат ЛОЖЬ;

КонецФункции // ОбработатьФайл()

Функция ИсправитьКонцевыеПробелы(Знач ИмяФайла)

	СодержимоеФайла = ФайловыеОперации.ПрочитатьТекстФайла(ИмяФайла);

	Если Не ЗначениеЗаполнено(СодержимоеФайла) Тогда
		
		Возврат Ложь;
		
	КонецЕсли;
	
	Регексп = Новый РегулярноеВыражение("^([^\n\/]*\S)([\t ]+?)$");
	Регексп.ИгнорироватьРегистр = ИСТИНА;
	Регексп.Многострочный = ИСТИНА;
	ГруппыИндексов = Регексп.НайтиСовпадения(СодержимоеФайла);
	Если ГруппыИндексов.Количество() = 0 Тогда

		Возврат ЛОЖЬ;	

	КонецЕсли;
	
	СодержимоеФайла = Регексп.Заменить(СодержимоеФайла, "$1");
	
	ФайловыеОперации.ЗаписатьТекстФайла(ИмяФайла, СодержимоеФайла);

	Возврат Истина;

КонецФункции

# language: ru

Функциональность: Выполнение прекоммита

Как разработчик
Я хочу быть уверенным, что precommit4onec корректно обрабатывает изменения в репозитории

Контекст:
	Допустим Я очищаю параметры команды "oscript" в контексте 
		И я очищаю параметры команды "git" в контексте
		И я включаю отладку лога с именем "oscript.app.precommit4onec"
		И я создаю временный каталог и запоминаю его как "КаталогРепозиториев"
		И я переключаюсь во временный каталог "КаталогРепозиториев"
		И я создаю новый репозиторий "rep1" в каталоге "КаталогРепозиториев" и запоминаю его как "РабочийКаталог"
		И я выполняю команду "oscript" с параметрами "<КаталогПроекта>/src/main.os install rep1"
		И я установил рабочий каталог как текущий каталог
		
Сценарий: Разбор отчетов, обработок, конфигурации на исходники.
	Когда Я копирую файл "fixtures/demo/DemoОбработка.epf" в каталог репозитория "РабочийКаталог"
		И я копирую файл "fixtures/demo/DemoОтчет.erf" в каталог репозитория "РабочийКаталог"
		И я копирую файл "fixtures/demo/DemoРасширение.cfe" в каталог репозитория "РабочийКаталог"
		И я фиксирую изменения в репозитории "РабочийКаталог" с комментарием "demo коммит"
	Тогда В каталоге "src" репозитория "РабочийКаталог" есть файл "erf\DemoОтчет\DemoОтчет\Forms\ОсновнаяОФ\Ext\Form\Module.bsl"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "erf\DemoОтчет\DemoОтчет\Forms\ОсновнаяОФ\Ext\Form\form"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "erf\DemoОтчет\DemoОтчет.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "erf\DemoОтчет\DemoОтчет\Templates\ОсновнаяСхемаКомпоновкиДанных.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "erf\DemoОтчет\DemoОтчет\Templates\ОсновнаяСхемаКомпоновкиДанных\Ext\Template.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "erf\DemoОтчет\DemoОтчет\Forms\ОсновнаяОФ.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "erf\DemoОтчет\DemoОтчет\Forms\ОсновнаяОФ\Ext\Form.bin"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "erf\DemoОтчет\DemoОтчет\Forms\ОсновнаяУФ.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "erf\DemoОтчет\DemoОтчет\Forms\ОсновнаяУФ\Ext\Form.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "epf\DemoОбработка\DemoОбработка.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "epf\DemoОбработка\DemoОбработка\Forms\ОсновнаяОФ.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "epf\DemoОбработка\DemoОбработка\Forms\ОсновнаяОФ\Ext\Form.bin"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "epf\DemoОбработка\DemoОбработка\Forms\ОсновнаяУФ.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "epf\DemoОбработка\DemoОбработка\Forms\ОсновнаяУФ\Ext\Form.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "epf\DemoОбработка\DemoОбработка\Forms\ОсновнаяОФ\Ext\Form\Module.bsl"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "epf\DemoОбработка\DemoОбработка\Forms\ОсновнаяОФ\Ext\Form\form"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "cfe\DemoРасширение\ConfigDumpInfo.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "cfe\DemoРасширение\Configuration.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "cfe\DemoРасширение\CommonModules\DemoРасш_Demo.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "cfe\DemoРасширение\CommonModules\DemoРасш_Demo\Ext\Module.bsl"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "cfe\DemoРасширение\Subsystems\DemoРасш_Demo.xml"
		И В каталоге "src" репозитория "РабочийКаталог" есть файл "cfe\DemoРасширение\Languages\Русский.xml"

Сценарий: Успешный коммит в репозиторий
	Когда Я копирую файл "fixtures\ПроверкаДублейПроцедурПоложительныйТест.bsl" в каталог репозитория "РабочийКаталог"
	И Я очищаю параметры команды "git" в контексте 
	И Я установил рабочий каталог как текущий каталог
	И Я устанавливаю кодировку вывода "utf-8" команды "git"
	И Я выполняю команду "git" с параметрами "add --all"
	И Я выполняю команду "git" с параметрами "commit -m addProcedure" 
	Тогда Вывод команды "git" не содержит "обнаружены неуникальные имена методов"

Сценарий: Прекоммит заблокировал коммит в репозиторий
	Когда Я копирую файл "fixtures\ПроверкаДублейПроцедурНегативныйТест.bsl" в каталог репозитория "РабочийКаталог"
	И Я очищаю параметры команды "git" в контексте
	И Я установил рабочий каталог как текущий каталог
	И Я устанавливаю кодировку вывода "utf-8" команды "git"
	И Я выполняю команду "git" с параметрами "add --all"
	И Я выполняю команду "git" с параметрами "commit -m addProcedure"
	Тогда Вывод команды "git" содержит "обнаружены неуникальные имена методов"

Сценарий: Прекоммит использует локальные настройки репозитория вместо глобальных
	Когда Я копирую каталог "localscenario" из каталога "fixtures" проекта в рабочий каталог
		И Я копирую файл "v8config.json" из каталога "fixtures" проекта в рабочий каталог
		И я выполняю команду "git" с параметрами "add --all"
		И я выполняю команду "git" с параметрами "commit -m addFile"
	Тогда я вижу в консоли вывод "Используем локальные настройки"

Сценарий: Выполнение локальных сценариев к каталоге репозитория
	Когда Я копирую файл "features/demo/DemoОбработка.epf" в каталог репозитория "РабочийКаталог"
		И Я копирую каталог "localscenario" из каталога "fixtures" проекта в рабочий каталог
		И Я копирую файл "v8config.json" из каталога "fixtures" проекта в рабочий каталог
		И я выполняю команду "git" с параметрами "add --all"
		И я выполняю команду "git" с параметрами "commit -m addFile"
	Тогда я вижу в консоли вывод "ДобавлениеHelloWorld"

Сценарий: Когда выключены глобальные сценарии и нет локальных прекоммит выдает ошибку
	Когда Я копирую файл "v8config.json" из каталога "fixtures" проекта в рабочий каталог
		И я выполняю команду "git" с параметрами "add --all"
		И я выполняю команду "git" с параметрами "commit -m addFile"
	Тогда я вижу в консоли вывод "Нет доступных сценариев обработки файлов"


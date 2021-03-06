﻿Функция Вызвать(Доступ, ИмяФункции, Параметр1 = Null, Параметр2 = Null, Параметр3 = Null, Параметр4 = Null, Параметр5 = Null) Экспорт
	Адрес = А1Э_Строки.Обрубить(Доступ.Адрес, "/") + "/hs/a1_api";
	Адрес = Адрес + "/" + А1Э_Строки.ДляУРЛ(ИмяФункции);
	Адрес = ПолныйАдресСПараметрами(Адрес, Параметр2, Параметр3, Параметр4, Параметр5);
	ДополнительныеПараметры = Новый Структура();
	ДополнительныеПараметры.Вставить("Аутентификация", Новый Структура("Пользователь,Пароль", Доступ.Пользователь, Доступ.Пароль));
	Если Параметр1 <> Null Тогда
		ДополнительныеПараметры.Вставить("Данные", А1Э_Сериализация.СвернутьУниверсальныйЖСОН(Параметр1));
	КонецЕсли;
	РезультатЗапроса = А1Э_Коннектор.Post(Адрес, , ДополнительныеПараметры);
	РезультатФункции = А1Э_Сериализация.РазвернутьУниверсальныйЖСОН(РезультатЗапроса.Ответ.ПолучитьТелоКакСтроку());
	Возврат РезультатФункции;
КонецФункции

Функция ПолныйАдресСПараметрами(Знач Адрес, Параметр2, Параметр3, Параметр4, Параметр5)
	Если Параметр2 = Null Тогда
		Возврат Адрес;
	КонецЕсли;
	Адрес = Адрес + "/" + А1Э_Строки.ДляУРЛ(А1Э_Сериализация.СвернутьУниверсальныйЖСОН(Параметр2));
	Если Параметр3 = Null Тогда
		Возврат Адрес;
	КонецЕсли;
	Адрес = Адрес + "/" + А1Э_Строки.ДляУРЛ(А1Э_Сериализация.СвернутьУниверсальныйЖСОН(Параметр3));
	Если Параметр4 = Null Тогда
		Возврат Адрес;
	КонецЕсли;
	Адрес = Адрес + "/" + А1Э_Строки.ДляУРЛ(А1Э_Сериализация.СвернутьУниверсальныйЖСОН(Параметр4));
	Если Параметр5 = Null Тогда
		Возврат Адрес;
	КонецЕсли;
	Адрес = Адрес + "/" + А1Э_Строки.ДляУРЛ(А1Э_Сериализация.СвернутьУниверсальныйЖСОН(Параметр5));
	Возврат Адрес;
КонецФункции 


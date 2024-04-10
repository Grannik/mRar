#!/bin/bash
#===================================================================================
fRarCommands()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 21);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=21;fi
 if [[ $aa -gt 21 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=21;fi
 if [[ $j1 -gt 21 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 21 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=26; a++ ))
  do
   echo -e "\e[${a};1H\e[90m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[90m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2H Команды                                                              \e[36m COMMANDS\e[0m";
 echo -en "\e[3;1H\e[90m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[25;1H\e[90m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[27;1H\e[90m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[4;2H Add files to archive                                                      \e[32m a \e[0m";}
  E1(){ echo -en "\e[5;2H Добавить комментарий к архиву                                             \e[32m c \e[0m";}
  E2(){ echo -en "\e[6;2H Изменить параметры архива                                                \e[32m ch \e[0m";}
  E3(){ echo -en "\e[7;2H Записать архивный комментарий в указанный файл                           \e[32m cw \e[0m";}
  E4(){ echo -en "\e[8;2H Удалить файлы из архива                                                   \e[32m d \e[0m";}
  E5(){ echo -en "\e[9;2H Извлечь файлы в текущий каталог. Не создает никаких подкаталогов          \e[32m e \e[0m";}
  E6(){ echo -en "\e[10;2H Освежить файлы в архиве                                                   \e[32m f \e[0m";}
  E7(){ echo -en "\e[11;2H Заблокировать архив                                                       \e[32m k \e[0m";}
  E8(){ echo -en "\e[12;2H Список содержимого архива [техническое[все], голое]               \e[32m l[t[a],b] \e[0m";}
  E9(){ echo -en "\e[13;2H Переместить в архив [только файлы]                                     \e[32m m[f] \e[0m";}
 E10(){ echo -en "\e[14;2H Print file to stdout                                                      \e[32m p \e[0m";}
 E11(){ echo -en "\e[15;2H Repair archive                                                            \e[32m r \e[0m";}
 E12(){ echo -en "\e[16;2H Восстановите отсутствующие тома, используя тома для восстановления       \e[32m rc \e[0m";}
 E13(){ echo -en "\e[17;2H Rename archived files                                                    \e[32m rn \e[0m";}
 E14(){ echo -en "\e[18;2H Добавьте запись восстановления данных                                 \e[32m rr[N] \e[0m";}
 E15(){ echo -en "\e[19;2H Создайте тома для восстановления (файлы .rev)                         \e[32m rv[N] \e[0m";}
 E16(){ echo -en "\e[20;2H Преобразование архива в или из SFX                                \e[32m s[name|-] \e[0m";}
 E17(){ echo -en "\e[21;2H Test archive files                                                        \e[32m t \e[0m";}
 E18(){ echo -en "\e[22;2H Обновите файлы в архиве                                                   \e[32m u \e[0m";}
 E19(){ echo -en "\e[23;2H Verbosely list archive [technical]                                \e[32m v[t[a],b] \e[0m";}
 E20(){ echo -en "\e[24;2H Extract files with full path                                              \e[32m x \e[0m";}
 E21(){ echo -en "\e[26;2H                                                                        \e[90m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;90m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавить файлы в архив:
\e[32m rar a archive.rar file\e[0m
#
\e[32m rar a archive.rar file1 file2 dir\e[0m
#
\e[32m rar a archive.rar *\e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;90m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавить комментарий к архиву. Длина комментария ограничена 256 КБ
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;90m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Изменить параметры архива.
 Может использоваться с большинством опций модификации архива.
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;90m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Записать архивный комментарий в указанный файл
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;90m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 удалить из архива можно ключом d:
\e[32m rar d archive.rar file\e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;90m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;90m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Освежить файлы в архиве.
 Обновления этих файлов изменились, так как они были запакованы в архив.
 Эта команда не будет добавлять новые файлы в архив.
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;90m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Заблокировать архив.
 Любая команда, намеревающаяся изменить архив, будет проигнорирована.
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[1;90m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Список содержимого архива [техническое[все], голое]
                           [technical  [all], bare ]
 'lt' отображает подробную информацию о файле в многострочном режиме.
              Команды 'lt', 'lta' и 'lb'
 равны соответственно 'vt', 'vta' и 'vb'.
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[1;90m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Переместить в архив [только файлы].
 Каталоги не будут удалены, если используется модификатор 'f'
 и/или применяется переключатель '-ed'.
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[1;90m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Распечатать файл на стандартный вывод:
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[1;90m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Архив ремонта. Подробности смотрите в rar.txt
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[1;90m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Восстановите отсутствующие тома, используя тома для восстановления (файлы .rev).
 В качестве имени архива необходимо указать любой существующий том, например,
\e[32m rar rc backup.part03.rar\e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[1;90m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Переименовать заархивированные файлы
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[1;90m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавьте запись восстановления данных.
 Дополнительно в архив может быть добавлена избыточная информация
 (запись восстановления).
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[1;90m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Создайте тома для восстановления (файлы .rev),
 которые впоследствии можно будет использовать для восстановления отсутствующих
 файлов в наборе томов. Эта команда имеет смысл только для многотомных архивов.
 Подробности смотрите в rar.txt.
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[1;90m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Преобразование архива в или из SFX.
 Архив сливается с SFX-модулем в домашней директории пользователя.
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[1;90m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Тестовые архивные файлы
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[1;90m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обновите файлы в архиве.
 Добавляет файлы, которых еще нет в архиве, и обновляет файлы,
 измененные с момента их упаковки в архив.
\e[32m rar u archive.rar file\e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[1;90m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Подробно перечислить архив [технический]
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[1;90m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Извлечь файлы с полным путем:
\e[32m rar x file.rar\e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 21)D;echo -en "\e[1;90m";(E21);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fRar;fi;;
esac;C;done
}
#===================================================================================
#===================================================================================
fRarOptionsA()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 30);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=30;fi
 if [[ $aa -gt 30 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=30;fi
 if [[ $j1 -gt 30 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 30 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=35; a++ ))
  do
   echo -e "\e[${a};1H\e[90m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[90m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2HОпции ( A - I )                                                     \e[36m OPTIONS\e[0m";
 echo -en "\e[3;1H\e[90m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[34;1H\e[90m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[36;1H\e[90m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[4;2H Display help on commands and switches                                    \e[32m -? \e[0m";}
  E1(){ echo -en "\e[5;2H Этот переключатель сообщает RAR, что в терминале нет переключателей      \e[32m -- \e[0m";}
  E2(){ echo -en "\e[6;2H Добавить имя архива к пути назначения                                   \e[32m -ad \e[0m";}
  E3(){ echo -en "\e[7;2H Создайте имя архива, используя текущую дату и время             \e[32m -ag[format] \e[0m";}
  E4(){ echo -en "\e[8;2H Ignore file attributes                                                  \e[32m -ai \e[0m";}
  E5(){ echo -en "\e[9;2H Установить путь внутри архива                                     \e[32m -ap<path> \e[0m";}
  E6(){ echo -en "\e[10;2H Синхронизируйте содержимое архива                                       \e[32m -as \e[0m";}
  E7(){ echo -en "\e[11;2H Disable reading configuration and environment                         \e[32m -cfg- \e[0m";}
  E8(){ echo -en "\e[12;2H Convert file names to lower case                                        \e[32m -cl \e[0m";}
  E9(){ echo -en "\e[13;2H Convert file names to upper case                                        \e[32m -cu \e[0m";}
 E10(){ echo -en "\e[14;2H Disable showing comments                                                \e[32m -c- \e[0m";}
 E11(){ echo -en "\e[15;2H Удалите файлы после архивации                                           \e[32m -df \e[0m";}
 E12(){ echo -en "\e[16;2H Open shared files                                                       \e[32m -dh \e[0m";}
 E13(){ echo -en "\e[17;2H Do not sort files while adding to a solid archive                       \e[32m -ds \e[0m";}
 E14(){ echo -en "\e[18;2H Wipe files after archiving                                              \e[32m -dw \e[0m";}
 E15(){ echo -en "\e[19;2H Do not add empty directories                                            \e[32m -ed \e[0m";}
 E16(){ echo -en "\e[20;2H Do not add 'end of archive' block                                       \e[32m -en \e[0m";}
 E17(){ echo -en "\e[21;2H Exclude paths from names                                                \e[32m -ep \e[0m";}
 E18(){ echo -en "\e[22;2H Exclude base dir from names                                            \e[32m -ep1 \e[0m";}
 E19(){ echo -en "\e[23;2H Expand paths to full                                                   \e[32m -ep2 \e[0m";}
 E20(){ echo -en "\e[24;2H Set file exclude [or include] attributes                        \e[32m -e[+]<attr> \e[0m";}
 E21(){ echo -en "\e[25;2H Freshen files                                                            \e[32m -f \e[0m";}
 E22(){ echo -en "\e[26;2H Encrypt as file data                                         \e[32m -hp [password] \e[0m";}
 E23(){ echo -en "\e[27;2H Select hash type [BLAKE2,CRC32] for file checksum                  \e[32m -ht[b|c] \e[0m";}
 E24(){ echo -en "\e[28;2H Disable messages                                               \e[32m -id[c,d,p,q] \e[0m";}
 E25(){ echo -en "\e[29;2H Send all messages to stderr                                           \e[32m -ierr \e[0m";}
 E26(){ echo -en "\e[30;2H Log errors to file (registered versions only)                   \e[32m -ilog[name] \e[0m";}
 E27(){ echo -en "\e[31;2H Disable all messages                                                  \e[32m -inul \e[0m";}
 E28(){ echo -en "\e[32;2H Enable sound                                                          \e[32m -isnd \e[0m";}
 E29(){ echo -en "\e[33;2H Display the version number                                            \e[32m -iver \e[0m";}
 E30(){ echo -en "\e[35;2H                                                                        \e[90m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;90m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Показать справку по командам и переключателям.
 То же, что и при вводе недопустимого параметра командной строки:
\e[32m rar -?\e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;90m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Этот переключатель сообщает RAR, что в командной строке больше нет переключателей.
 Это может быть полезно, если имя архива или файла начинается с '-' характер.
 Без переключателя '--' такое имя будет рассматриваться как переключатель.
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;90m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавить имя архива к пути назначения
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;90m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Создайте имя архива, используя текущую дату и время.
 Добавляет текущую строку даты к имени архива при создании архива.
 Полезно для ежедневного резервного копирования.
 Подробности смотрите в rar.txt
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;90m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Игнорировать атрибуты файла:
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;90m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Установить путь внутри архива.
 Этот путь объединяется с именами файлов при добавлении файлов в архив
 и удаляется из имен файлов при извлечении:
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;90m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Синхронизируйте содержимое архива.
 Если этот переключатель используется при архивировании, то те архивные файлы,
 которых нет в списке текущих добавленных файлов, будут удалены из архива.
 Этот ключ удобно использовать в сочетании с -u (обновление)
 для синхронизации содержимого архива и каталога архивации:
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;90m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отключить конфигурацию и среду чтения:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[1;90m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Преобразование имен файлов в нижний регистр\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[1;90m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Преобразование имен файлов в верхний регистр:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[1;90m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отключить показ комментариев:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[1;90m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Удалите файлы после архивации.
 Этот переключатель в сочетании с командой «a»
 выполняет то же действие, что и команда «m»:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[1;90m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Открывайте общие файлы:\e[32m \e[0m
 Позволяет обрабатывать файлы, открытые другими приложениями, для записи.
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[1;90m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Не сортируйте файлы при добавлении в цельный архив:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[1;90m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Стереть файлы после архивации:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[1;90m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Не добавляйте пустые каталоги:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[1;90m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Не добавляйте блок «конец архива».
 Этот переключатель нельзя использовать с томами, потому что конец блока архива
 содержит информацию, важную для правильной обработки тома:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[1;90m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Исключить пути из имен:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[1;90m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Исключить базовый каталог из имен:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[1;90m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Расширьте пути до полного.
 Сохраняйте полные пути к файлам
 (кроме буквы диска и начального разделителя пути) при архивировании:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[1;90m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Установить файл для исключения [или включения] атрибутов:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 21)D;echo -en "\e[1;90m";(E21);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Освежить файлы. Может использоваться при извлечении или создании архива:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 22)D;echo -en "\e[1;90m";(E22);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Шифруйте как данные файла, так и заголовки. Пароль чувствителен к регистру.
 Если вы опустите пароль в командной строке,
 вам будет предложено сообщение «Введите пароль»:
\e[32m rar a -hp archive.rar file.png\e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 23)D;echo -en "\e[1;90m";(E23);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Выберите тип хэша [BLAKE2,CRC32] для контрольной суммы файла:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 24)D;echo -en "\e[1;90m";(E24);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отключить сообщения:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 25)D;echo -en "\e[1;90m";(E25);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отправлять все сообщения на stderr:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 26)D;echo -en "\e[1;90m";(E26);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Записывать ошибки в файл (только для зарегистрированных версий):\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 27)D;echo -en "\e[1;90m";(E27);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отключить все сообщения:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 28)D;echo -en "\e[1;90m";(E28);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Включить звук:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 29)D;echo -en "\e[1;90m";(E29);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Показать номер версии:
\e[32m rar -iver\e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 30)D;echo -en "\e[1;90m";(E30);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fRar;fi;;
esac;C;done
}
#===================================================================================
#===================================================================================
#===================================================================================
fRarOptionsB()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 30);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=30;fi
 if [[ $aa -gt 30 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=30;fi
 if [[ $j1 -gt 30 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 30 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=35; a++ ))
  do
   echo -e "\e[${a};1H\e[90m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[90m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2HОпции ( K - S )                                                     \e[36m OPTIONS\e[0m";
 echo -en "\e[3;1H\e[90m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[34;1H\e[90m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[36;1H\e[90m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[4;2H Lock archive                                                             \e[32m -k \e[0m";}
  E1(){ echo -en "\e[5;2H Keep broken extracted files                                             \e[32m -kb \e[0m";}
  E2(){ echo -en "\e[6;2H Write names to log file                                      \e[32m -log[f][=name] \e[0m";}
  E3(){ echo -en "\e[7;2H Set compression level (0-store...3-default...5-best)               \e[32m -m<0..5> \e[0m";}
  E4(){ echo -en "\e[8;2H Specify a version of archiving format                              \e[32m -ma[4|5] \e[0m";}
  E5(){ echo -en "\e[9;2H Set advanced compression parameters                                \e[32m -mc<par> \e[0m";}
  E6(){ echo -en "\e[10;2H Set dictionary size in KB, MB or GB                        \e[32m -md<size>[k,m,g] \e[0m";}
  E7(){ echo -en "\e[11;2H Specify file types (extensions) to store                       \e[32m -ms[ext;ext] \e[0m";}
  E8(){ echo -en "\e[12;2H Set the number of threads                                      \e[32m -mt<threads> \e[0m";}
  E9(){ echo -en "\e[13;2H Additionally filter included files                                 \e[32m -n<file> \e[0m";}
 E10(){ echo -en "\e[14;2H Read additional filter masks from stdin                                 \e[32m -n@ \e[0m";}
 E11(){ echo -en "\e[15;2H Read additional filter masks from list file                       \e[32m -n@<list> \e[0m";}
 E12(){ echo -en "\e[16;2H Overwrite existing files                                                \e[32m -o+ \e[0m";}
 E13(){ echo -en "\e[17;2H Do not overwrite existing files                                         \e[32m -o- \e[0m";}
 E14(){ echo -en "\e[18;2H Save hard links as the link instead of the file                         \e[32m -oh \e[0m";}
 E15(){ echo -en "\e[19;2H Save identical files as references                           \e[32m -oi[0-4][:min] \e[0m";}
 E16(){ echo -en "\e[20;2H Process symbolic links as the link [absolute paths]                  \e[32m -ol[a] \e[0m";}
 E17(){ echo -en "\e[21;2H Rename files automatically                                              \e[32m -or \e[0m";}
 E18(){ echo -en "\e[22;2H Save or restore file owner and group                                    \e[32m -ow \e[0m";}
 E19(){ echo -en "\e[23;2H Encrypt files with the given string as password while archiving\e[32m -p[password] \e[0m";}
 E20(){ echo -en "\e[24;2H Do not query password                                                   \e[32m -p- \e[0m";}
 E21(){ echo -en "\e[25;2H Add quick open information [none|force]                            \e[32m -qo[-|+] \e[0m";}
 E22(){ echo -en "\e[26;2H Recurse subdirectories                                                   \e[32m -r \e[0m";}
 E23(){ echo -en "\e[27;2H Disable recursion                                                       \e[32m -r- \e[0m";}
 E24(){ echo -en "\e[28;2H Similar to -r, but when used with the commands 'a', 'u', 'f', 'm'       \e[32m -r0 \e[0m";}
 E25(){ echo -en "\e[29;2H Add data recovery record                                             \e[32m -rr[N] \e[0m";}
 E26(){ echo -en "\e[30;2H Create recovery volumes                                              \e[32m -rv[N] \e[0m";}
 E27(){ echo -en "\e[31;2H Create  solid  groups  using  file count                              \e[32m -s<N> \e[0m";}
 E28(){ echo -en "\e[32;2H Create solid groups using extension                                     \e[32m -se \e[0m";}
 E29(){ echo -en "\e[33;2H Create  independent  solid volumes                                      \e[32m -sv \e[0m";}
 E30(){ echo -en "\e[35;2H                                                                        \e[90m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;90m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Заблокировать архив:\e[32m \e[0m
 Любая команда, намеревающаяся изменить архив, будет проигнорирована.
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;90m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сохраняйте поврежденные извлеченные файлы:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;90m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Записать имена в файл журнала:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;90m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Установить уровень сжатия (0-сохранить...3-по умолчанию...5-наилучший).
 По умолчанию rar использует метод -m3 (обычное сжатие):
\e[32m rar a -m5 archive.rar file\e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;90m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Укажите версию формата архивации:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;90m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Установите расширенные параметры сжатия:\e[32m \e[0m
 Подробности смотрите в rar.txt
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;90m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Установите размер словаря в КБ, МБ или ГБ:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;90m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Укажите типы файлов (расширения) для хранения:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[1;90m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Установите количество потоков.
 Если этот переключатель не указан, RAR попытается определить количество доступных
 процессоров и автоматически выберет оптимальное количество потоков:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[1;90m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Дополнительно фильтровать включенные файлы:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[1;90m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Чтение дополнительных масок фильтров из стандартного ввода:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[1;90m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Чтение дополнительных масок фильтров из файла списка:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[1;90m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Перезаписать существующие файлы:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[1;90m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Не перезаписывать существующие файлы:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[1;90m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сохраняйте жесткие ссылки как ссылку вместо файла:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[1;90m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сохраняйте идентичные файлы в качестве ссылок:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[1;90m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обрабатывать символические ссылки как ссылки [абсолютные пути]:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[1;90m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Автоматически переименовывать файлы:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[1;90m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сохранить или восстановить владельца файла и группу:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[1;90m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Шифровать файлы с заданной строкой в качестве пароля при архивировании.
 Пароль чувствителен к регистру. Если вы опустите пароль в командной строке,
 вам будет предложено сообщение «Введите пароль»:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[1;90m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Не запрашивать пароль:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 21)D;echo -en "\e[1;90m";(E21);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавить информацию для быстрого открытия [none|force]:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 22)D;echo -en "\e[1;90m";(E22);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Создать архив директории dir01 рекурсивно:
\e[32m rar -r a archive.rar dir\e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 23)D;echo -en "\e[1;90m";(E23);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отключить рекурсию:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 24)D;echo -en "\e[1;90m";(E24);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Аналогичен -r, но при использовании с командами\e[32m a\e[0m,\e[32m u\e[0m,\e[32m f\e[0m,\e[32m m\e[0m подкаталоги будут
 рекурсивно выполняться только для имен с подстановочными знаками:
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 25)D;echo -en "\e[1;90m";(E25);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавить запись восстановления данных:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 26)D;echo -en "\e[1;90m";(E26);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Создайте тома восстановления:
 \e[32m \e[0m -s Создать сплошной архив
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 27)D;echo -en "\e[1;90m";(E27);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Создавайте сплошные группы, используя количество файлов.
 Аналогичен -s, но сбрасывает твердую статистику после сжатия <N> файлов:
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 28)D;echo -en "\e[1;90m";(E28);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Создавайте сплошные группы, используя расширение.
 Аналогичен -s, но сбрасывает твердую статистику, если расширение файла изменено:
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 29)D;echo -en "\e[1;90m";(E29);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Создавайте независимые твердые тома.
 Аналогичен -s, но сбрасывает твердую статистику
 как можно быстрее при запуске нового тома:
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 30)D;echo -en "\e[1;90m";(E30);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fRar;fi;;
esac;C;done
}
#===================================================================================
#===================================================================================
#===================================================================================
#===================================================================================
fRarOptionsC()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 25);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=25;fi
 if [[ $aa -gt 25 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=25;fi
 if [[ $j1 -gt 25 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 25 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=30; a++ ))
  do
   echo -e "\e[${a};1H\e[90m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[90m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2H Опции ( S - Z )                                                     \e[36m OPTIONS\e[0m";
 echo -en "\e[3;1H\e[90m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[29;1H\e[90m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[31;1H\e[90m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[4;2H Create dependent solid volumes                                         \e[32m -sv- \e[0m";}
  E1(){ echo -en "\e[5;2H Disable solid archiving                                                 \e[32m -s- \e[0m";}
  E2(){ echo -en "\e[6;2H Specify the character set                                     \e[32m -sc<chr>[obj] \e[0m";}
  E3(){ echo -en "\e[7;2H Create SFX archives                                              \e[32m -sfx[name] \e[0m";}
  E4(){ echo -en "\e[8;2H Read data from standard input (stdin)                             \e[32m -si[name] \e[0m";}
  E5(){ echo -en "\e[9;2H Process files with size less than specified                       \e[32m -sl<size> \e[0m";}
  E6(){ echo -en "\e[10;2H Process files with size more than specified                       \e[32m -sm<size> \e[0m";}
  E7(){ echo -en "\e[11;2H Test files after archiving                                               \e[32m -t \e[0m";}
  E8(){ echo -en "\e[12;2H Process files modified after <date> in YYYYMMDDHHMMSS format      \e[32m -ta<date> \e[0m";}
  E9(){ echo -en "\e[13;2H Process files modified before <date> in YYYYMMDDHHMMSS format     \e[32m -tb<date> \e[0m";}
 E10(){ echo -en "\e[14;2H Keep original archive time                                              \e[32m -tk \e[0m";}
 E11(){ echo -en "\e[15;2H Set archive time to latest file                                         \e[32m -tl \e[0m";}
 E12(){ echo -en "\e[16;2H Process files newer than <time>                                   \e[32m -tn<time> \e[0m";}
 E13(){ echo -en "\e[17;2H Process files older than <time>                                   \e[32m -to<time> \e[0m";}
 E14(){ echo -en "\e[18;2H Save or restore file time (modification, creation, access)       \e[32m -ts[m|c|a] \e[0m";}
 E15(){ echo -en "\e[19;2H Update files                                                             \e[32m -u \e[0m";}
 E16(){ echo -en "\e[20;2H Create volumes with size=<size>*1000 [*1024, *1] bytes        \e[32m -v<size>[k|b] \e[0m";}
 E17(){ echo -en "\e[21;2H File version control                                                \e[32m -ver[n] \e[0m";}
 E18(){ echo -en "\e[22;2H Use the old style volume naming scheme                                  \e[32m -vn \e[0m";}
 E19(){ echo -en "\e[23;2H Pause before each volume                                                \e[32m -vp \e[0m";}
 E20(){ echo -en "\e[24;2H Assign work directory                                              \e[32m -w<path> \e[0m";}
 E21(){ echo -en "\e[25;2H Exclude specified file                                             \e[32m -x<file> \e[0m";}
 E22(){ echo -en "\e[26;2H Exclude files in specified list file                              \e[32m -x@<list> \e[0m";}
 E23(){ echo -en "\e[27;2H Read file names to exclude from stdin                                   \e[32m -x@ \e[0m";}
 E24(){ echo -en "\e[28;2H Assume Yes on all queries                                                \e[32m -y \e[0m";}
 E25(){ echo -en "\e[30;2H                                                                        \e[90m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;90m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Создание зависимых твердых объемов.
 Аналогичен -s, но сброс твердой статистики отключен:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;90m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отключить сплошное архивирование:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;90m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Укажите набор символов:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;90m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Создавайте SFX-архивы.
 Архив объединяется с именем SFX-модуля в домашней директории пользователя.
 Модуль по умолчанию взят из \e[32m/usr/lib/default.sfx\e[0m
 Имейте в виду, что вы должны сопровождать результат файлом
\e[32m /usr/share/doc/rar/acknow.txt\e[0m при распространении,
 который содержит лицензии третьих сторон, применимые к default.sfx:
\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;90m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Чтение данных из стандартного ввода (stdin):\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;90m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обрабатывать файлы с размером меньше указанного:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;90m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обрабатывать файлы с размером больше указанного:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;90m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Тестовые файлы после архивации:\e[32m \e[0m
 Этот переключатель особенно полезен в сочетании с командой перемещения,
 поэтому файлы будут удалены только в том случае, если архив успешно протестирован.
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[1;90m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обрабатывать файлы, измененные после <date> в YYYYMMDDHHMMSS:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[1;90m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обрабатывать файлы, измененные до <даты>, в формате ГГГГММДДЧЧММСС:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[1;90m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сохраняйте исходное время архива.
 Запрещает rar изменять дату архива при изменении архива:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[1;90m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Установите время архивации на последний файл.
 Заставляет rar устанавливать дату измененного архива на дату самого нового файла
 в архиве:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[1;90m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обрабатывать файлы новее, чем <время>:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[1;90m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обрабатывать файлы старше <время>:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[1;90m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сохранить или восстановить время файла (модификация,  создание, доступ).
                                        (modification, creation, access).
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[1;90m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обновить файлы. Добавить файлы в архив можно с помощью ключа -u:\e[32m\e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[1;90m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Создайте тома с     size=<size>*1000 [*1024, *1] байт
 Create volumes with size=<size>*1000 [*1024, *1] bytes
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[1;90m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Контроль версий файлов:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[1;90m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Используйте старую схему именования томов:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[1;90m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Пауза перед каждым томом:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[1;90m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Назначить рабочий каталог:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 21)D;echo -en "\e[1;90m";(E21);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Исключить указанный файл.
 Можно использовать подстановочные знаки,
 и вы можете указать переключатель «-x» несколько раз:
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 22)D;echo -en "\e[1;90m";(E22);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Исключить файлы из указанного списка файлов:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 23)D;echo -en "\e[1;90m";(E23);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Чтение имен файлов для исключения из стандартного ввода:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 24)D;echo -en "\e[1;90m";(E24);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Предположим, что Да во всех запросах:\e[32m \e[0m
";echo -en "\e[1;90m ENTER = main menu ";read;INI;fi;;
 25)D;echo -en "\e[1;90m";(E25);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fRar;fi;;
esac;C;done
}
#===================================================================================
#===================================================================================
#===================================================================================
#===================================================================================
fRar()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 12);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=12;fi
 if [[ $aa -gt 12 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=12;fi
 if [[ $j1 -gt 12 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 12 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=31; a++ ))
  do
   echo -e "\e[${a};1H\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
  done
 echo -en "\e[1;1H\033[0m\e[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[3;3H\e[1m *** rar ***\e[0m";
 echo -en "\e[4;3H\e[2m archive files with compression\e[0m";
 echo -en "\e[5;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[11;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[12;3H Команды                                                           \e[36m COMMANDS\e[0m";
 echo -en "\e[13;3H \e[2m После имени программы следует команда, а затем необязательные переключатели\e[0m";
 echo -en "\e[14;3H \e[2m с тире перед ними. Краткое описание команд приведено ниже.\e[0m";
 echo -en "\e[15;3H \e[2m Для полного описания запустите rar-?\e[0m";
 echo -en "\e[17;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[18;3H Опции                                                              \e[36m OPTIONS\e[0m";
 echo -en "\e[19;3H \e[2m Каждый переключатель должен быть разделен пробелом. Их нельзя совмещать.   \e[0m";
 echo -en "\e[23;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[25;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[27;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[29;1H\e[47;30m├\e[0m─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[32;1H\e[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[6;3H Установка                                                          \e[32m INSTALL \e[0m";}
  E1(){ echo -en "\e[7;3H Kраткий обзор                                                     \e[32m SYNOPSIS \e[0m";}
  E2(){ echo -en "\e[8;3H Описание                                                       \e[32m DESCRIPTION \e[0m";}
  E3(){ echo -en "\e[9;3H Смотрите также                                                    \e[32m SEE ALSO \e[0m";}
  E4(){ echo -en "\e[10;3H Авторы                                                             \e[32m AUTHORS \e[0m";}
  E5(){ echo -en "\e[16;3H Команды                                                          \e[32m  COMMANDS \e[0m";}
  E6(){ echo -en "\e[20;3H Опции ( A - I )                                                    \e[32m OPTIONS \e[0m";}
  E7(){ echo -en "\e[21;3H Опции ( K - S )                                                    \e[32m OPTIONS \e[0m";}
  E8(){ echo -en "\e[22;3H Опции ( S - Z )                                                    \e[32m OPTIONS \e[0m";}
  E9(){ echo -en "\e[24;3H Для распаковки может использоваться утилита unrar                    \e[32m unrar \e[0m";}
 E10(){ echo -en "\e[26;3H                                                                    \e[32m RARJPEG \e[0m";}
 E11(){ echo -en "\e[28;3H                                                                        \e[36m Git \e[0m";}
 E12(){ echo -en "\e[30;3H                                                                        Exit ";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[47;30m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Установить архиватор можно средствами стандартного пакетного менеджера вашей
 операционной системы:
\e[32m sudo apt install rar\e[0m или\e[32m sudo apt install unar\e[0m
 Однако, для установки последней актуальной версии воспользуемся другим способом.
 Скачиваем с официального сайта архив с бинарными файлами и извлекаем из него файлы
 rar и unrar, далее копируем их, например, в /usr/bin/, либо производим установку:
\e[36m wget https://www.rarlab.com/rar/rarlinux-x64-612.tar.gz\e[0m\e[32m
 tar xzf rarlinux-x64-612.tar.gz
 cd rar
 make install\e[0m
 Команда make install
 выполнит следующие действия согласно содержимому файла makefile:\e[32m
 mkdir -p /usr/local/bin
 mkdir -p /usr/local/lib
 cp rar unrar /usr/local/bin
 cp rarfiles.lst /etc
 cp default.sfx /usr/local/lib
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[47;30m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 rar  <command>  [-<switch  1>  -<switch  N>]
 archive  [files...] [@list‐files...] [path_to_extract]
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[47;30m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Эта страница руководства кратко описывает архиватор rar.
 Эта справочная страница была написана для дистрибутива Debian GNU/Linux,
 поскольку исходная программа не имеет справочной страницы.
 Описанные здесь команды и параметры относятся к версии rar 5.50.
 rar — это программа для создания и управления архивами .rar
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[47;30m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Программа полностью задокументирована в файле rar.txt, который вы найдете в
\e[32m /usr/share/doc/rar\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[47;30m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Эта страница руководства была написана Петром Чехом\e[36m cech@debian.org\e[0m
 согласно \"rar -?\" для системы Debian GNU/Linux (но может использоваться другими).
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[47;30m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fRarCommands;echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[47;30m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fRarOptionsA;echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[47;30m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fRarOptionsB;echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[47;30m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fRarOptionsC;echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[47;30m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Для распаковки RAR-архивов используется утилита unrar. Распаковать архив:
\e[32m unrar x archive.rar\e[0m

 Распаковать архив в определенную директорию:
\e[32m unrar x archive.rar ./dir\e[0m

 Проверить, что архив целый:
\e[32m unrar t archive.rar\e[0m

 Просмотреть список файлов в архиве:
\e[32m unrar l archive.rar\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[47;30m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 RARJPEG — особый вид файлового контейнера: иллюстрация JPEG, к которой встык
 (в тот же файл) дописан архив RAR. В зависимости от расширения такой файл может
 восприниматься различными программами и как иллюстрация JPEG, и как архив RAR.
 Это обстоятельство позволяет, например, использовать имиджборды (принимающие
 только иллюстрации) в качестве анонимных файловых хостингов для архивов.
 Тот же метод может использоваться и для некоторых других форматов: к
 иллюстрациям JPEG, GIF, PNG или ко звукозаписям WAV могут быть дописаны архивы
 RAR или ZIP или звукозаписи MP3. Впрочем, для открытия RAR-архивов и особенно
 ZIP-архивов из такого файла сгодится далеко не всякий архиватор — WinRAR,
 впрочем, справляется.
 Технологически сей метод основан на том, что программа, читающая первый файл,
 игнорирует все данные, следующие за логическим концом его (и оттого игнорирует
 весь второй файл), а программа, читающая второй файл, настойчиво разыскивает
 его заголовок и игнорирует всё, что заголовку предшествует (и тем самым
 способна сперва пропустить весь первый файл, ничуть им не смущаясь, после чего
 начать чтение сразу со второго).
 В *nix-подобных системах сия операция проделывается следующим образом:
\e[32m cat file1.jpg file2.rar > result.jpg\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[47;30m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Di 12 Jul 2021 16:42:14 CEST
 mRar Описание утилиты rar. Archive files with compression
 Asciinema:  \e[36m https://asciinema.org/a/653423\e[0m
 Codeberg:   \e[36m https://codeberg.org/Grannik/mRar\e[0m
 Github:     \e[36m \e[0m
 Gitlab:     \e[36m \e[0m
 Sourceforge:\e[36m \e[0m
 Notabug:    \e[36m \e[0m
 Bitbucket:  \e[36m \e[0m
 Framagit:   \e[36m \e[0m
 GFogs:      \e[36m \e[0m
 Gitea       \e[36m \e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[47;30m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;exit 0;fi;;
esac;C;done
}
fRar

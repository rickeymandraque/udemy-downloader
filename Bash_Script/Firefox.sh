#! /bin/bash

# clear


Get_Locale="$(locale | grep -E '^LANG=' | awk -F= '{print $2}'| awk -F. '{print $1}')"
Minus_Locale="$(echo $Get_Locale | awk -F_ '{print $1}')"
Up_Locale="$(echo $Get_Locale | awk -F_ '{print $2}')"

if [[ $Minus_Locale = "fr" ]]; then
  Locale="fr"
else
  Locale="$Minus_Locale-$Up_Locale"
fi


function mkcd() {
  mkdir -p "$@" && cd "$_";
}

function Get_Firefox() {
  url="https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=${Locale}"
  echo "wget --content-disposition $url"
}

function Download_Firefox() {

echo "Your system language has been detected as $Locale."
read -r -p "Do you want to use this language for Firefox? (Yes/no) : "
if [[ $REPLY =~ ^[Yy]$ ]]
then
  Get_Firefox
else

echo "Choose your language for Firefox portable"
cat <<EOF
Available languages:
     NUMBER   COUNTRY		      CODE
     1	   Acholi                     ach
     2	   Afrikaans                  af
     3	   Albanian                   sq
     4	   Arabic                     ar
     5	   Aragonese                  an
     6	   Armenian                   hy-AM
     7	   Assamese                   as
     8	   Asturian                   ast
     9	   Azerbaijani                az
    10	   Basque                     eu
    11	   Belarusian                 be
    12	   Bengali (Bangladesh)       bn-BD
    13	   Bengali (India)            bn-IN
    14	   Bosnian                    bs
    15	   Breton                     br
    16	   Bulgarian                  bg
    17	   Catalan                    ca
    18	   Chinese (Simplified)       zh-CN
    19	   Chinese (Traditional)      zh-TW
    20	   Croatian                   hr
    21	   Czech                      cs
    22	   Danish                     da
    23	   Dutch                      nl
    24	   English (British)          en-GB
    25	   English (South African)    en-ZA
    26	   English (United States)    en-US
    27	   Esperanto                  eo
    28	   Estonian                   et
    29	   Finnish                    fi
    30	   French                     fr
    31	   Frisian                    fy-NL
    32	   Fulah                      ff
    33	   Gaelic (Scotland)          gd
    34	   Galician                   gl
    35	   German                     de
    36	   Greek                      el
    37	   Gujarati (India)           gu-IN
    38	   Hebrew                     he
    39	   Hindi (India)              hi-IN
    40	   Hungarian                  hu
    41	   Icelandic                  is
    42	   Indonesian                 id
    43	   Irish                      ga-IE
    44	   Italian                    it
    45	   Kannada                    kn
    46	   Kazakh                     kk
    47	   Khmer                      km
    48	   Korean                     ko
    49	   Latvian                    lv
    50	   Ligurian                   lij
    51	   Lithuanian                 lt
    52	   Lower Sorbian              dsb
    53	   Macedonian                 mk
    54	   Maithili                   mai
    55	   Malay                      ms
    56	   Malayalam                  ml
    57	   Marathi                    mr
    58	   Norwegian (BokmÃ¥l)        nb-NO
    59	   Norwegian (Nynorsk)        nn-NO
    60	   Oriya                      or
    61	   Persian                    fa
    62	   Polish                     pl
    63	   Portuguese (Brazilian)     pt-BR
    64	   Portuguese (Portugal)      pt-PT
    65	   Punjabi (India)            pa-IN
    66	   Romanian                   ro
    67	   Romansh                    rm
    68	   Russian                    ru
    69	   Serbian                    sr
    70	   Sinhala                    si
    71	   Slovak                     sk
    72	   Slovenian                  sl
    73	   Songhai                    son
    74	   Spanish (Argentina)        es-AR
    75	   Spanish (Chile)            es-CL
    76	   Spanish (Mexico)           es-MX
    77	   Spanish (Spain)            es-ES
    78	   Swedish                    sv-SE
    79	   Tamil                      ta
    80	   Telugu                     te
    81	   Thai                       th
    82	   Turkish                    tr
    83	   Ukrainian                  uk
    84	   Upper Sorbian              hsb
    85	   Uzbek                      uz
    86	   Vietnamese                 vi
    87	   Welsh                      cy
    88	   Xhosa                      xh

EOF

read -r COUNTRY

case $COUNTRY in

  '1'|'ach')
		echo "You choose Acholi"
		Locale="ach"
		;;

	'2'|'af')
		echo "You choose Afrikaans"
		Locale="af"
		;;

	'3'|'sq')
		echo "You choose Albanian"
		Locale="sq"
		;;

	'4'|'ar')
		echo "You choose Arabic"
		Locale="ar"
		;;

	'5'|'an')
		echo "You choose Aragonese"
		Locale="an"
		;;

	'6'|'hy-AM')
		echo "You choose Armenian"
		Locale="hy-AM"
		;;

	'7'|'as')
		echo "You choose Assamese"
		Locale="as"
		;;

	'8'|'ast')
		echo "You choose Asturian"
		Locale="ast"
		;;

	'9'|'az')
		echo "You choose Azerbaijani"
		Locale="az"
		;;

	'10'|'eu')
		echo "You choose Basque"
		Locale="eu"
		;;

	'11'|'be')
		echo "You choose Belarusian"
		Locale="be"
		;;

	'12'|'bn-BD')
		echo "You choose Bengali (Bangladesh)"
		Locale="bn-BD"
		;;

	'13'|'bn-IN')
		echo "You choose Bengali (India)"
		Locale="bn-IN"
		;;

	'14'|'bs')
		echo "You choose Bosnian"
		Locale="bs"
		;;

	'15'|'br')
		echo "You choose Breton"
		Locale="br"
		;;

	'16'|'bg')
		echo "You choose Bulgarian"
		Locale="bg"
		;;

	'17'|'ca')
		echo "You choose Catalan"
		Locale="ca"
		;;

	'18'|'zh-CN')
		echo "You choose Chinese (Simplified)"
		Locale="zh-CN"
		;;

	'19'|'zh-TW')
		echo "You choose Chinese (Traditional)"
		Locale="zh-TW"
		;;

	'20'|'hr')
		echo "You choose Croatian"
		Locale="hr"
		;;

	'21'|'cs')
		echo "You choose Czech"
		Locale="cs"
		;;

	'22'|'da')
		echo "You choose Danish"
		Locale="da"
		;;

	'23'|'nl')
		echo "You choose Dutch"
		Locale="nl"
		;;

	'24'|'en-GB')
		echo "You choose English (British)"
		Locale="en-GB"
		;;

	'25'|'en-ZA')
		echo "You choose English (South African)   "
		Locale="en-ZA"
		;;

	'26'|'en-US')
		echo "You choose English (United States)   "
		Locale="en-US"
		;;

	'27'|'eo')
		echo "You choose Esperanto"
		Locale="eo"
		;;

	'28'|'et')
		echo "You choose Estonian"
		Locale="et"
		;;

	'29'|'fi')
		echo "You choose Finnish"
		Locale="fi"
		;;

	'30'|'fr')
		echo "You choose French"
		Locale="fr"
		;;

	'31'|'fy-NL')
		echo "You choose Frisian"
		Locale="fy-NL"
		;;

	'32'|'ff')
		echo "You choose Fulah"
		Locale="ff"
		;;

	'33'|'gd')
		echo "You choose Gaelic (Scotland)"
		Locale="gd"
		;;

	'34'|'gl')
		echo "You choose Galician"
		Locale="gl"
		;;

	'35'|'de')
		echo "You choose German"
		Locale="de"
		;;

	'36'|'el')
		echo "You choose Greek"
		Locale="el"
		;;

	'37'|'gu-IN')
		echo "You choose Gujarati (India)"
		Locale="gu-IN"
		;;

	'38'|'he')
		echo "You choose Hebrew"
		Locale="he"
		;;

	'39'|'hi-IN')
		echo "You choose Hindi (India)"
		Locale="hi-IN"
		;;

	'40'|'hu')
		echo "You choose Hungarian"
		Locale="hu"
		;;

	'41'|'is')
		echo "You choose Icelandic"
		Locale="is"
		;;

	'42'|'id')
		echo "You choose Indonesian"
		Locale="id"
		;;

	'43'|'ga-IE')
		echo "You choose Irish"
		Locale="ga-IE"
		;;

	'44'|'it')
		echo "You choose Italian"
		Locale="it"
		;;

	'45'|'kn')
		echo "You choose Kannada"
		Locale="kn"
		;;

	'46'|'kk')
		echo "You choose Kazakh"
		Locale="kk"
		;;

	'47'|'km')
		echo "You choose Khmer"
		Locale="km"
		;;

	'48'|'ko')
		echo "You choose Korean"
		Locale="ko"
		;;

	'49'|'lv')
		echo "You choose Latvian"
		Locale="lv"
		;;

	'50'|'lij')
		echo "You choose Ligurian"
		Locale="lij"
		;;

	'51'|'lt')
		echo "You choose Lithuanian"
		Locale="lt"
		;;

	'52'|'dsb')
		echo "You choose Lower Sorbian"
		Locale="dsb"
		;;

	'53'|'mk')
		echo "You choose Macedonian"
		Locale="mk"
		;;

	'54'|'mai')
		echo "You choose Maithili"
		Locale="mai"
		;;

	'55'|'ms')
		echo "You choose Malay"
		Locale="ms"
		;;

	'56'|'ml')
		echo "You choose Malayalam"
		Locale="ml"
		;;

	'57'|'mr')
		echo "You choose Marathi"
		Locale="mr"
		;;

	'58'|'nb-NO')
		echo "You choose Norwegian (BokmÃ¥l)"
		Locale="nb-NO"
		;;

	'59'|'nn-NO')
		echo "You choose Norwegian (Nynorsk)"
		Locale="nn-NO"
		;;

	'60'|'or')
		echo "You choose Oriya"
		Locale="or"
		;;

	'61'|'fa')
		echo "You choose Persian"
		Locale="fa"
		;;

	'62'|'pl')
		echo "You choose Polish"
		Locale="pl"
		;;

	'63'|'pt-BR')
		echo "You choose Portuguese (Brazilian)"
		Locale="pt-BR"
		;;

	'64'|'pt-PT')
		echo "You choose Portuguese (Portugal)"
		Locale="pt-PT"
		;;

	'65'|'pa-IN')
		echo "You choose Punjabi (India)"
		Locale="pa-IN"
		;;

	'66'|'ro')
		echo "You choose Romanian"
		Locale="ro"
		;;

	'67'|'rm')
		echo "You choose Romansh"
		Locale="rm"
		;;

	'68'|'ru')
		echo "You choose Russian"
		Locale="ru"
		;;

	'69'|'sr')
		echo "You choose Serbian"
		Locale="sr"
		;;

	'70'|'si')
		echo "You choose Sinhala"
		Locale="si"
		;;

	'71'|'sk')
		echo "You choose Slovak"
		Locale="sk"
		;;

	'72'|'sl')
		echo "You choose Slovenian"
		Locale="sl"
		;;

	'73'|'son')
		echo "You choose Songhai"
		Locale="son"
		;;

	'74'|'es-AR')
		echo "You choose Spanish (Argentina)"
		Locale="es-AR"
		;;

	'75'|'es-CL')
		echo "You choose Spanish (Chile)"
		Locale="es-CL"
		;;

	'76'|'es-MX')
		echo "You choose Spanish (Mexico)"
		Locale="es-MX"
		;;

	'77'|'es-ES')
		echo "You choose Spanish (Spain)"
		Locale="es-ES"
		;;

	'78'|'sv-SE')
		echo "You choose Swedish"
		Locale="sv-SE"
		;;

	'79'|'ta')
		echo "You choose Tamil"
		Locale="ta"
		;;

	'80'|'te')
		echo "You choose Telugu"
		Locale="te"
		;;

	'81'|'th')
		echo "You choose Thai "
		Locale="th"
		;;

	'82'|'tr')
		echo "You choose Turkish"
		Locale="tr"
		;;

	'83'|'uk')
		echo "You choose Ukrainian"
		Locale="uk"
		;;

	'84'|'hsb')
		echo "You choose Upper Sorbian"
		Locale="hsb"
		;;

	'85'|'uz')
		echo "You choose Uzbek"
		Locale="uz"
		;;

	'86'|'vi')
		echo "You choose Vietnamese"
		Locale="vi"
		;;

	'87'|'cy')
		echo "You choose Welsh"
		Locale="cy"
		;;

	'88'|'xh')
		echo "You choose Xhosa"
		Locale="xh"
		;;

  *)
    echo "unknown"
    exit 1
    ;;

esac
Get_Firefox
exit 0
fi
}

function Portabilizer() {
  #statements
}

Download_Firefox

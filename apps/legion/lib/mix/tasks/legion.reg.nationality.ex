defmodule Mix.Tasks.Legion.Reg.Nationality do
  @moduledoc """
  Registers nationalities to the repository.
  """
  use Legion.RegistryDirectory.Synchronization, site: Legion.Messaging.Settings, repo: Legion.Repo

  alias Legion.Repo
  alias Legion.Identity.Information.Nationality

  def put_nationality(
        abbreviation,
        country_name,
        preferred_demonym,
        second_demonym,
        third_demonym
      ) do
    Repo.insert!(%Nationality{
      abbreviation: downcase_if_not_nil(abbreviation),
      country_name: downcase_if_not_nil(country_name),
      preferred_demonym: downcase_if_not_nil(preferred_demonym),
      second_demonym: downcase_if_not_nil(second_demonym),
      third_demonym: downcase_if_not_nil(third_demonym)
    })

    Mix.shell().info("added nationality #{country_name}")
  rescue
    Ecto.ConstraintError ->
      Mix.shell().info("cannot add nationality #{country_name}, it is already loaded")
  end

  defp downcase_if_not_nil(string) when is_binary(string),
    do: String.downcase(string)

  defp downcase_if_not_nil(string) when is_nil(string),
    do: nil

  def sync do
    Mix.shell().info("== Synchronizing nationalities")

    put_nationality "AD", "Andorra", "Andorran", nil, nil
    put_nationality "AE", "United Arab Emirates", "Emirian", "Emirati", nil
    put_nationality "AF", "Afghanistan", "Afghani", "Afghan", nil
    put_nationality "AG", "Antigua and Barbuda", "Antiguan", nil, nil
    put_nationality "AI", "Anguilla", "Anguillan", nil, nil
    put_nationality "AL", "Albania", "Albanian", "Alabanian", nil
    put_nationality "AM", "Armenia", "Armenian", "Hayastani", nil
    put_nationality "AO", "Angola", "Angolan", nil, nil
    put_nationality "AQ", "Antarctica", "Antarctic", nil, nil
    put_nationality "AR", "Argentina", "Argentine", "Argentinian", "Argentinean"
    put_nationality "AS", "American Samoa", "Samoan", nil, nil
    put_nationality "AT", "Austria", "Austrian", nil, nil
    put_nationality "AU", "Australia", "Australian", nil, nil
    put_nationality "AW", "Aruba", "Arubian", nil, nil
    put_nationality "AX", "Åland Islands", "Ålandic", "Ålandish", nil
    put_nationality "AZ", "Azerbaijan", "Azerbaijani", nil, nil
    put_nationality "BA", "Bosnia and Herzegovina", "Bosnian", "Herzegovinian", nil
    put_nationality "BB", "Barbados", "Barbadian", "Barbadan", "Bajan"
    put_nationality "BD", "Bangladesh", "Bangladeshi", nil, nil
    put_nationality "BE", "Belgium", "Belgian", nil, nil
    put_nationality "BF", "Burkina Faso", "Burkinabe", nil, nil
    put_nationality "BG", "Bulgaria", "Bulgarian", nil, nil
    put_nationality "BH", "Bahrain", "Bahrainian", nil, nil
    put_nationality "BI", "Burundi", "Burundian", nil, nil
    put_nationality "BJ", "Benin", "Beninese", nil, nil
    put_nationality "BL", "Saint Barthélemy", "Barthélemois", nil, nil
    put_nationality "BM", "Bermuda", "Bermudan", nil, nil
    put_nationality "BN", "Brunei", "Bruneian", nil, nil
    put_nationality "BO", "Bolivia", "Bolivian", nil, nil
    put_nationality "BQ", "Caribbean Netherlands", nil, nil, nil
    put_nationality "BR", "Brazil", "Brazilian", nil, nil
    put_nationality "BS", "Bahamas", "Bahameese", "Bahamian", nil
    put_nationality "BT", "Bhutan", "Bhutanese", nil, nil
    put_nationality "BV", "Bouvet Island", nil, nil, nil
    put_nationality "BW", "Botswana", "Motswana", "Batswana", nil
    put_nationality "BY", "Belarus", "Belarusian", nil, nil
    put_nationality "BZ", "Belize", "Belizean", nil, nil
    put_nationality "CA", "Canada", "Canadian", nil, nil
    put_nationality "CC", "Cocos (Keeling) Islands", "Cocossian", "Cocos Islandia", nil
    put_nationality "CD", "Democratic Republic of the Congo", "Congolese", nil, nil
    put_nationality "CF", "Central African Republic", "Central African", nil, nil
    put_nationality "CG", "Congo (Republic of)", "Congolese", nil, nil
    put_nationality "CH", "Switzerland", "Swiss", nil, nil
    put_nationality "CI", "Côte d'Ivoire (Ivory Coast)", "Ivorian", nil, nil
    put_nationality "CK", "Cook Islands", "Cook Islander", nil, nil
    put_nationality "CL", "Chile", "Chilean", nil, nil
    put_nationality "CM", "Cameroon", "Cameroonian", nil, nil
    put_nationality "CN", "China", "Chinese", nil, nil
    put_nationality "CO", "Colombia", "Colombian", "Columbian", nil
    put_nationality "CR", "Costa Rica", "Costa Rican", nil, nil
    put_nationality "CU", "Cuba", "Cuban", nil, nil
    put_nationality "CV", "Cape Verde", "Cape Verdean", nil, nil
    put_nationality "CW", "Curaçao", "Curaçaoan", nil, nil
    put_nationality "CX", "Christmas Island", "Christmas Islander", nil, nil
    put_nationality "CY", "Cyprus", "Cypriot", nil, nil
    put_nationality "CZ", "Czech Republic", "Czech", nil, nil
    put_nationality "DE", "Germany", "German", nil, nil
    put_nationality "DJ", "Djibouti", "Djiboutian", "Djibouti", nil
    put_nationality "DK", "Denmark", "Danish", "Dane", nil
    put_nationality "DM", "Dominica", "Dominican", nil, nil
    put_nationality "DO", "Dominican Republic", "Dominican", nil, nil
    put_nationality "DZ", "Algeria", "Algerian", nil, nil
    put_nationality "EC", "Ecuador", "Ecuadorean", "Ecudorean", nil
    put_nationality "EE", "Estonia", "Estonian", nil, nil
    put_nationality "EG", "Egypt", "Egyptian", nil, nil
    put_nationality "EH", "Western Saharan", "Western Saharan", "Sahrawi", nil
    put_nationality "ER", "Eritrea", "Eritrean", nil, nil
    put_nationality "ES", "Spain", "Spanish", nil, nil
    put_nationality "ET", "Ethiopia", "Ethiopian", nil, nil
    put_nationality "FI", "Finland", "Finnish", nil, nil
    put_nationality "FJ", "Fiji", "Fijian", nil, nil
    put_nationality "FK", "Falkland Islands", "Falkland Islander", nil, nil
    put_nationality "FM", "Micronesia", "Micronesian", nil, nil
    put_nationality "FO", "Faroe Islands", "Faroese", nil, nil
    put_nationality "FR", "France", "French", nil, nil
    put_nationality "GA", "Gabon", "Gabonese", nil, nil
    put_nationality "GB", "United Kingdom", "British", nil, nil
    put_nationality "GD", "Grenada", "Grenadian", nil, nil
    put_nationality "GE", "Georgia", "Georgian", nil, nil
    put_nationality "GF", "French Guiana", "French Guianese", nil, nil
    put_nationality "GG", "Guernsey", nil, nil, nil
    put_nationality "GH", "Ghana", "Ghanaian", "Ghanian", nil
    put_nationality "GI", "Gibraltar", "Gibraltarian", nil, nil
    put_nationality "GL", "Greenland", "Greenlander", "Greenlandic", nil
    put_nationality "GM", "Gambia", "Gambian", nil, nil
    put_nationality "GN", "Guinea", "Guinean", nil, nil
    put_nationality "GP", "Guadeloupe", "Guadeloupean", nil, nil
    put_nationality "GQ", "Equatorial Guinea", "Equatorial Guinean", "Equatoguinean", nil
    put_nationality "GR", "Greece", "Greek", nil, nil
    put_nationality "GS", "South Georgia and the South Sandwich Islands", nil, nil, nil
    put_nationality "GT", "Guatemala", "Guatemalan", nil, nil
    put_nationality "GU", "Guam", "Guamanian", nil, nil
    put_nationality "GW", "Guinea-Bissau", "Guinean", nil, nil
    put_nationality "GY", "Guyana", "Guyanese", nil, nil
    put_nationality "HK", "Hong Kong", "Hong Konger", nil, nil
    put_nationality "HM", "Heard and McDonald Islands", nil, nil, nil
    put_nationality "HN", "Honduras", "Honduran", nil, nil
    put_nationality "HR", "Croatia", "Croatian", "Croat", nil
    put_nationality "HT", "Haiti", "Haitian", nil, nil
    put_nationality "HU", "Hungary", "Hungarian", nil, nil
    put_nationality "ID", "Indonesia", "Indonesian", nil, nil
    put_nationality "IE", "Ireland", "Irish", nil, nil
    put_nationality "IL", "Israel", "Israeli", nil, nil
    put_nationality "IM", "Isle of Man", "Manx", nil, nil
    put_nationality "IN", "India", "Indian", nil, nil
    put_nationality "IO", "British Indian Ocean Territory", nil, nil, nil
    put_nationality "IQ", "Iraq", "Iraqi", nil, nil
    put_nationality "IR", "Iran", "Iranian", nil, nil
    put_nationality "IS", "Iceland", "Icelander", nil, nil
    put_nationality "IT", "Italy", "Italian", nil, nil
    put_nationality "JE", "Jersey", nil, nil, nil
    put_nationality "JM", "Jamaica", "Jamaican", nil, nil
    put_nationality "JO", "Jordan", "Jordanian", nil, nil
    put_nationality "JP", "Japan", "Japanese", nil, nil
    put_nationality "KE", "Kenya", "Kenyan", nil, nil
    put_nationality "KG", "Kyrgyzstan", "Kyrgyzstani", nil, nil
    put_nationality "KH", "Cambodia", "Cambodian", nil, nil
    put_nationality "KI", "Kiribati", "I-Kiribati", nil, nil
    put_nationality "KM", "Comoros", "Comoran", nil, nil
    put_nationality "KN", "Saint Kitts and Nevis", "Kittian", "Nevisian", nil
    put_nationality "KP", "North Korea", "North Korean", nil, nil
    put_nationality "KR", "South Korea", "South Korean", nil, nil
    put_nationality "KW", "Kuwait", "Kuwaiti", nil, nil
    put_nationality "KY", "Cayman Islands", "Caymanian", nil, nil
    put_nationality "KZ", "Kazakhstan", "Kazakhstani", "Kazakh", nil
    put_nationality "LA", "Laos", "Laotian", nil, nil
    put_nationality "LB", "Lebanon", "Lebanese", nil, nil
    put_nationality "LC", "Saint Lucia", "Saint Lucian", nil, nil
    put_nationality "LI", "Liechtenstein", "Liechtensteiner", nil, nil
    put_nationality "LK", "Sri Lanka", "Sri Lankan", nil, nil
    put_nationality "LR", "Liberia", "Liberian", nil, nil
    put_nationality "LS", "Lesotho", "Mosotho", "Basotho", nil
    put_nationality "LT", "Lithuania", "Lithunian", nil, nil
    put_nationality "LU", "Luxembourg", "Luxembourger", nil, nil
    put_nationality "LV", "Latvia", "Latvian", nil, nil
    put_nationality "LY", "Libya", "Libyan", nil, nil
    put_nationality "MA", "Morocco", "Moroccan", nil, nil
    put_nationality "MC", "Monaco", "Monacan", nil, nil
    put_nationality "MD", "Moldova", "Moldovan", nil, nil
    put_nationality "ME", "Montenegro", "Montenegrin", nil, nil
    put_nationality "MF", "Saint Martin (France)", nil, nil, nil
    put_nationality "MG", "Madagascar", "Malagasy", nil, nil
    put_nationality "MH", "Marshall Islands", "Marshallese", nil, nil
    put_nationality "MK", "Macedonia", "Macedonian", nil, nil
    put_nationality "ML", "Mali", "Malian", nil, nil
    put_nationality "MM", "Burma (Republic of the Union of Myanmar)", "Myanmarese", "Burmese", nil
    put_nationality "MN", "Mongolia", "Mongolian", nil, nil
    put_nationality "MO", "Macau", "Macanese", nil, nil
    put_nationality "MP", "Northern Mariana Islands", "Northern Mariana Islander", nil, nil
    put_nationality "MQ", "Martinique", "Martinican", "Martiniquaís", nil
    put_nationality "MR", "Mauritania", "Mauritanian", nil, nil
    put_nationality "MS", "Montserrat", "Montserratian", nil, nil
    put_nationality "MT", "Malta", "Maltese", nil, nil
    put_nationality "MU", "Mauritius", "Mauritian", nil, nil
    put_nationality "MV", "Maldives", "Maldivan", nil, nil
    put_nationality "MW", "Malawi", "Malawian", nil, nil
    put_nationality "MX", "Mexico", "Mexican", nil, nil
    put_nationality "MY", "Malaysia", "Malaysian", nil, nil
    put_nationality "MZ", "Mozambique", "Mozambican", nil, nil
    put_nationality "NA", "Namibia", "Namibian", nil, nil
    put_nationality "NC", "New Caledonia", "New Caledonian", "New Caledonians", nil
    put_nationality "NE", "Niger", "Nigerien", nil, nil
    put_nationality "NF", "Norfolk Island", "Norfolk Islander", nil, nil
    put_nationality "NG", "Nigeria", "Nigerian", nil, nil
    put_nationality "NI", "Nicaragua", "Nicaraguan", "Nicoya", nil
    put_nationality "NL", "Netherlands", "Dutch", nil, nil
    put_nationality "NO", "Norway", "Norwegian", nil, nil
    put_nationality "NP", "Nepal", "Nepalese", nil, nil
    put_nationality "NR", "Nauru", "Nauruan", nil, nil
    put_nationality "NU", "Niue", "Niuean", nil, nil
    put_nationality "NZ", "New Zealand", "New Zealander", nil, nil
    put_nationality "OM", "Oman", "Omani", nil, nil
    put_nationality "PA", "Panama", "Panamanian", nil, nil
    put_nationality "PE", "Peru", "Peruvian", nil, nil
    put_nationality "PF", "French Polynesia", "French Polynesian", nil, nil
    put_nationality "PG", "Papua New Guinea", "Papua New Guinean", nil, nil
    put_nationality "PH", "Philippines", "Filipino", nil, nil
    put_nationality "PK", "Pakistan", "Pakistani", nil, nil
    put_nationality "PL", "Poland", "Polish", "Pole", nil
    put_nationality "PM", "St. Pierre and Miquelon", "Saint-Pierrais", "Miquelonnais", nil
    put_nationality "PN", "Pitcairn", "Pitcairn Islander", nil, nil
    put_nationality "PR", "Puerto Rico", "Puerto Rican", nil, nil
    put_nationality "PS", "Palestine", "Palestinian", nil, nil
    put_nationality "PT", "Portugal", "Portuguese", "Portugese", nil
    put_nationality "PW", "Palau", "Palauan", nil, nil
    put_nationality "PY", "Paraguay", "Paraguayan", nil, nil
    put_nationality "QA", "Qatar", "Qatari", nil, nil
    put_nationality "RE", "Réunion", nil, nil, nil
    put_nationality "RO", "Romania", "Romanian", nil, nil
    put_nationality "RS", "Serbia", "Serbian", "Serb", nil
    put_nationality "RU", "Russian Federation", "Russian", nil, nil
    put_nationality "RW", "Rwanda", "Rwandan", "Rwandese", nil
    put_nationality "SA", "Saudi Arabia", "Saudi Arabian", "Saudi", nil
    put_nationality "SB", "Solomon Islands", "Solomon Islander", nil, nil
    put_nationality "SC", "Seychelles", "Seychellois", nil, nil
    put_nationality "SD", "Sudan", "Sudanese", nil, nil
    put_nationality "SE", "Sweden", "Swedish", "Swede", nil
    put_nationality "SG", "Singapore", "Singaporean", nil, nil
    put_nationality "SH", "Saint Helena", "Saint Helenian", nil, nil
    put_nationality "SI", "Slovenia", "Slovenian", "Slovene", nil
    put_nationality "SJ", "Svalbard and Jan Mayen Islands", nil, nil, nil
    put_nationality "SK", "Slovakia", "Slovakian", "Slovak", nil
    put_nationality "SL", "Sierra Leone", "Sierra Leonean", nil, nil
    put_nationality "SM", "San Marino", "Sanmarinese", "Sammarinese", nil
    put_nationality "SN", "Senegal", "Senegalese", nil, nil
    put_nationality "SO", "Somalia", "Somali", nil, nil
    put_nationality "SR", "Suriname", "Surinamer", "Surinamese", nil
    put_nationality "SS", "South Sudan", "Sudanese", nil, nil
    put_nationality "ST", "São Tome and Príncipe", "São Tomean", "Sao Tomean", nil
    put_nationality "SV", "El Salvador", "Salvadorean", "Salvadoran", nil
    put_nationality "SX", "Saint Martin (Netherlands)", nil, nil, nil
    put_nationality "SY", "Syria", "Syrian", nil, nil
    put_nationality "SZ", "Swaziland", "Swazi", nil, nil
    put_nationality "TC", "Turks and Caicos Islands", "Turks and Caicos Islander", nil, nil
    put_nationality "TD", "Chad", "Chadian", nil, nil
    put_nationality "TF", "French Southern Territories", nil, nil, nil
    put_nationality "TG", "Togo", "Togolese", nil, nil
    put_nationality "TH", "Thailand", "Thai", nil, nil
    put_nationality "TJ", "Tajikistan", "Tajikistani", nil, nil
    put_nationality "TK", "Tokelau", "Tokelauan", nil, nil
    put_nationality "TL", "Timor-Leste", "Timorese", nil, nil
    put_nationality "TM", "Turkmenistan", "Turkmen", nil, nil
    put_nationality "TN", "Tunisia", "Tunisian", nil, nil
    put_nationality "TO", "Tonga", "Tongan", nil, nil
    put_nationality "TR", "Turkey", "Turkish", "Turk", nil
    put_nationality "TT", "Trinidad and Tobago", "Trinidadian", "Tobagonian", nil
    put_nationality "TV", "Tuvalu", "Tuvaluan", nil, nil
    put_nationality "TW", "Taiwan", "Taiwanese", nil, nil
    put_nationality "TZ", "Tanzania", "Tanzanian", nil, nil
    put_nationality "UA", "Ukraine", "Ukrainian", nil, nil
    put_nationality "UG", "Uganda", "Ugandan", nil, nil
    put_nationality "UM", "United States Minor Outlying Islands", nil, nil, nil
    put_nationality "US", "United States of America", "American", nil, nil
    put_nationality "UY", "Uruguay", "Uruguayan", nil, nil
    put_nationality "UZ", "Uzbekistan", "Uzbekistani", nil, nil
    put_nationality "VA", "Vatican", nil, nil, nil
    put_nationality "VC", "Saint Vincent and Grenadines", "Saint Vincentian", "Vincentian", nil
    put_nationality "VE", "Venezuela", "Venezuelan", nil, nil
    put_nationality "VG", "British Virgin Islands", "Virgin Islander", nil, nil
    put_nationality "VI", "United States Virgin Islands", "Virgin Islander", nil, nil
    put_nationality "VN", "Vietnam", "Vietnamese", nil, nil
    put_nationality "VU", "Vanuatu", "Ni-Vanuatu", nil, nil
    put_nationality "WF", "Wallis and Futuna Islands", "Wallisian", "Futunan", nil
    put_nationality "WS", "Samoa", "Samoan", nil, nil
    put_nationality "YE", "Yemen", "Yemeni", "Yemenese", nil
    put_nationality "YT", "Mayotte", "Mahoran", nil, nil
    put_nationality "ZA", "South Africa", "South African", nil, nil
    put_nationality "ZM", "Zambia", "Zambian", nil, nil
    put_nationality "ZW", "Zimbabwe", "Zimbabwean", nil, nil

    Mix.shell().info("== Finished synchronizing nationalities")
  end
end

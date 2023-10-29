{ config, ... }:
{
  programs.newsboat = {
    enable = true;
    autoReload = true;
    browser = config.programs.zsh.sessionVariables.BROWSER;
    reloadThreads = 4; # good measure
    urls = [
      # Blogs and misc feeds
      { url = "https://soda.privatevoid.net/num/blog/index.xml"; tags = [ "blog" ]; }
      { url = "https://lukesmith.xyz/index.xml"; tags = [ "blog" ]; }
      { url = "https://www.nasaspaceflight.com/feed/"; tags = [ "news" "space" ]; }
      { url = "https://www.nasaspaceflight.com/news/spacex/feed/"; tags = [ "news" "space" "spacex" ]; }
      { url = "https://gpanders.com/index.xml"; tags = [ "blog" ]; }

      # Don't judge me
      { title = "3Blue1Brown / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCYO_jab_esuFRV4b17AJtAw"; tags = [ "youtube" ]; }
      { title = "Adam Savage’s Tested / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCiDJtJKMICpb9B1qf7qjEOA"; tags = [ "youtube" ]; }
      { title = "ADVENTURES with Christian / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCj1ttljM7VDEytVHgwNnMBQ"; tags = [ "youtube" ]; }
      { title = "Andreas Kling / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3ts8coMP645hZw9JSD3pqQ"; tags = [ "youtube" ]; }
      { title = "Andrew Goetsch / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCGp64m-mg5yJEIAe5Awa3-w"; tags = [ "youtube" ]; }
      { title = "Andrew Huberman / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2D2CMWXMOVWx7giW1n3LIg"; tags = [ "youtube" ]; }
      { title = "Anton Petrov / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCciQ8wFcVoIIMi-lfu8-cjQ"; tags = [ "youtube" ]; }
      { title = "AntVenom / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCK376qNDlNZZDNHsnaWuTeg"; tags = [ "youtube" ]; }
      { title = "Astronomy Live / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBhuX1yNlQ3dssQDXA7czNg"; tags = [ "youtube" ]; }
      { title = "Austin Barnard / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR7AtcbLJEKmBNI3Id86BkA"; tags = [ "youtube" ]; }
      { title = "AustinMcConnell / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbxQcz9k0NRRuy0ukgQTDQQ"; tags = [ "youtube" ]; }
      { title = "Bacon_ / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcybVOrBgpzUxm-mlBT0WTA"; tags = [ "youtube" ]; }
      { title = "bald and bankrupt / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxDZs_ltFFvn0FDHT6kmoXA"; tags = [ "youtube" ]; }
      { title = "BdoubleO100 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClu2e7S8atp6tG2galK9hgg"; tags = [ "youtube" ]; }
      { title = "Better Ideas / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtUId5WFnN82GdDy7DgaQ7w"; tags = [ "youtube" ]; }
      { title = "Bisqwit / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCKTehwyGCKF-b2wo0RKwrcg"; tags = [ "youtube" ]; }
      { title = "blackrack / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3HxLMZsW2WEvZmghrHmEzw"; tags = [ "youtube" ]; }
      { title = "Boston Dynamics / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7vVhkEfw4nOGp8TyDk7RcQ"; tags = [ "youtube" ]; }
      { title = "BPS.space / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCILl8ozWuxnFYXIe2svjHhg"; tags = [ "youtube" ]; }
      { title = "Bushradical / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCo698VL13Dip93yh0f4Rc5Q"; tags = [ "youtube" ]; }
      { title = "Cape Canaveral Space Force Museum / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwqoJp4Okmfg4J_oPxQuoRA"; tags = [ "youtube" ]; }
      { title = "carykh / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9z7EZAbkphEMg0SP7rw44A"; tags = [ "youtube" ]; }
      { title = "CaseyNeistat / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtinbF-Q-fVthA0qrFQTgXQ"; tags = [ "youtube" ]; }
      { title = "CGP Grey / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2C_jShtL725hvbm1arSV9w"; tags = [ "youtube" ]; }
      { title = "Channel 5 with Andrew Callaghan / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC-AQKm7HUNMmxjdS371MSwg"; tags = [ "youtube" ]; }
      { title = "Choki / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoOJhQHVjtRM1ObXX7xiXHA"; tags = [ "youtube" ]; }
      { title = "Cody'sBLab / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2MJylovjrLtsGP0_4UrqrQ"; tags = [ "youtube" ]; }
      { title = "Cody'sLab / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCu6mSoMNzHQiBIOCkHUa2Aw"; tags = [ "youtube" ]; }
      { title = "colinfurze / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCp68_FLety0O-n9QU6phsgw"; tags = [ "youtube" ]; }
      { title = "Computerphile / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9-y-6csu5WGm29I7JiwpnA"; tags = [ "youtube" ]; }
      { title = "Corridor Crew / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSpFnDQr88xCZ80N-X7t0nQ"; tags = [ "youtube" ]; }
      { title = "Cosmic Perspective / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCh3jrub_0od3EFoUtiIG4jQ"; tags = [ "youtube" ]; }
      { title = "Count Dankula / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7SeFWZYFmsm1tqWxfuOTPQ"; tags = [ "youtube" ]; }
      { title = "Count Dankula 2 : Electric Boogaloo / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCRLO8HU2LWaMH6mjbQ1falQ"; tags = [ "youtube" ]; }
      { title = "CrebleStar / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCKsNdROsHuP6mLA9-r322hg"; tags = [ "youtube" ]; }
      { title = "Daily Bald / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCB2GbNXOsy3VBksSD58NvhQ"; tags = [ "youtube" ]; }
      { title = "dancer / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCiWIXrNOE4Lm-TqXxJ0ze9w"; tags = [ "youtube" ]; }
      { title = "Danny2462 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8DIKwGU8wFZfk3Xi3-zcrQ"; tags = [ "youtube" ]; }
      { title = "DenshiVideo / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCNwGa76xVVwdEVToRZBIUIg"; tags = [ "youtube" ]; }
      { title = "Derek Banas / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwRXb5dUK4cvsHbx-rGzSgw"; tags = [ "youtube" ]; }
      { title = "docm77 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4O9HKe9Jt5yAhKuNv3LXpQ"; tags = [ "youtube" ]; }
      { title = "Druaga1 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC-7I1gU1r6PxBSl87o-7YEQ"; tags = [ "youtube" ]; }
      { title = "ElectroBOOM / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJ0-OtVpF0wOKEqT2Z1HEtA"; tags = [ "youtube" ]; }
      { title = "Epic Spaceflight / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3TYqvyVC62DQtqCjjd352A"; tags = [ "youtube" ]; }
      { title = "EthosLab / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFKDEp9si4RmHFWJW1vYsMA"; tags = [ "youtube" ]; }
      { title = "Everyday Astronaut / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6uKrU_WqJ1R2HMTY3LIx5Q"; tags = [ "youtube" ]; }
      { title = "Forest Anon / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCnPtGAdJLT7K93dEbW0OQxA"; tags = [ "youtube" ]; }
      { title = "Gavin Freeborn / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJetJ7nDNLlEzDLXv7KIo0w"; tags = [ "youtube" ]; }
      { title = "GeoWizard / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCW5OrUZ4SeUYkUg1XqcjFYA"; tags = [ "youtube" ]; }
      { title = "Ghost Town Living / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEjBDKfrqQI4TgzT9YLNT8g"; tags = [ "youtube" ]; }
      { title = "GoodTimesWithScar / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCodkNmk9oWRTIYZdr_HuSlg"; tags = [ "youtube" ]; }
      { title = "gotbletu / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCkf4VIqu3Acnfzuk3kRIFwA"; tags = [ "youtube" ]; }
      { title = "Graham Stephan / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCV6KDgJskWaEckne5aPA0aQ"; tags = [ "youtube" ]; }
      { title = "Great Measures / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCttB5CXMadukUg0_e7q13Bw"; tags = [ "youtube" ]; }
      { title = "Greg Hurrell / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCXPHFM88IlFn68OmLwtPmZA"; tags = [ "youtube" ]; }
      { title = "Grian / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR9Gcq0CMm6YgTzsDxAxjOQ"; tags = [ "youtube" ]; }
      { title = "Hazegrayart / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCh2dnrLCNHDS2IV9I2R58Pw"; tags = [ "youtube" ]; }
      { title = "Hell on Earth / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCu0HvCbIS1SwTJm5kzLg6AQ"; tags = [ "youtube" ]; }
      { title = "Hermitcraft Recap - a show by fans for fans / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC32w6uX5qtmUtF4QQQ2PKaQ"; tags = [ "youtube" ]; }
      { title = "HowToBasic / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR4s1DE9J4DHzZYXMltSMAg"; tags = [ "youtube" ]; }
      { title = "HydeWars / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCfUaZ8Ra7m7BqUEACv2jySw"; tags = [ "youtube" ]; }
      { title = "Incognito Mode / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8Q7XEy86Q7T-3kNpNjYgwA"; tags = [ "youtube" ]; }
      { title = "Integza / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2avWDLN1EI3r1RZ_dlSxCw"; tags = [ "youtube" ]; }
      { title = "Internet Comment Etiquette with Erik / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCyWDmyZRjrGHeKF-ofFsT5Q"; tags = [ "youtube" ]; }
      { title = "Internet Historian / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR1D15p_vdP3HkrH8wgjQRw"; tags = [ "youtube" ]; }
      { title = "Jacob Sorber / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwd5VFu4KoJNjkWJZMFJGHQ"; tags = [ "youtube" ]; }
      { title = "Jay Foreman / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbbQalJ4OaC0oQ0AqRaOJ9g"; tags = [ "youtube" ]; }
      { title = "Jerobeam Fenderson 📟 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCECl4aNz5hvuRzW5fgCOHKQ"; tags = [ "youtube" ]; }
      { title = "Jesús Rodríguez Valencia / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3oIcS73_jhutDKsMA3gVpA"; tags = [ "youtube" ]; }
      { title = "Jim Browning / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBNG0osIBAprVcZZ3ic84vw"; tags = [ "youtube" ]; }
      { title = "Joe Collins / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCTfabOKD7Yty6sDF4POBVqA"; tags = [ "youtube" ]; }
      { title = "Joe Grand / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCqGONXW1ORgz5Y4qK-0JdkQ"; tags = [ "youtube" ]; }
      { title = "John Randolph / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCH4DpGhcN-FC8vJyThNZ8AQ"; tags = [ "youtube" ]; }
      { title = "Johnny Harris / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmGSJVG3mCRXVOP4yZrU1Dw"; tags = [ "youtube" ]; }
      { title = "Jonathan Paulson / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCuWLIm0l4sDpEe28t41WITA"; tags = [ "youtube" ]; }
      { title = "Jonathan Pie / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCO79NsDE5FpMowUH1YcBFcA"; tags = [ "youtube" ]; }
      { title = "Jordan B Peterson / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCL_f53ZEJxp8TtlOkHwMV9Q"; tags = [ "youtube" ]; }
      { title = "Jordan B Peterson Clips / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCodkb-qBktJI5NrUsPYpf7g"; tags = [ "youtube" ]; }
      { title = "Kai Hendry / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFzGyNKXPAglNq28qWYTDFA"; tags = [ "youtube" ]; }
      { title = "Keralis / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcJgOennb0II4a_qi9OMkRA"; tags = [ "youtube" ]; }
      { title = "Kerbal Space Program / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC-ZlXbhKDI6m0IQGGSNvtaw"; tags = [ "youtube" ]; }
      { title = "Kolya The Storyteller / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEN0k8Ogt2_ETatX_LHQRkw"; tags = [ "youtube" ]; }
      { title = "Kris Occhipinti / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCf93fPKwotph47H3_KDcRyg"; tags = [ "youtube" ]; }
      { title = "Kurzgesagt – In a Nutshell / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsXVk37bltHxD1rDPwtNM8Q"; tags = [ "youtube" ]; }
      { title = "LabPadre Space / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFwMITSkc1Fms6PoJoh1OUQ"; tags = [ "youtube" ]; }
      { title = "Lex Fridman / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSHZKyawb77ixDdsGog4iWA"; tags = [ "youtube" ]; }
      { title = "LiamBrown / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxDK-L1efdz873nmcPm2xQA"; tags = [ "youtube" ]; }
      { title = "Life of Tom / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFYs3KYHDPoZfwGv0A4sYGQ"; tags = [ "youtube" ]; }
      { title = "Limmy / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZ8Ql34vQn91fzq0xvG9Pqg"; tags = [ "youtube" ]; }
      { title = "LiveOverflow / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClcE-kVhqyiHCcjYwcpfj9w"; tags = [ "youtube" ]; }
      { title = "Luke Smith / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA"; tags = [ "youtube" ]; }
      { title = "lunarmodule5 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9joNm8jec_JdGF7UBFY2GA"; tags = [ "youtube" ]; }
      { title = "Mark Rober / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCY1kMZp36IQSyNx_9h4mpCg"; tags = [ "youtube" ]; }
      { title = "Markus Persson / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCW4BscaN7XuLrLsCnbrV9wA"; tags = [ "youtube" ]; }
      { title = "Martijn Doolaard / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClkUhTjFbQbtGfS14h9Vw5g"; tags = [ "youtube" ]; }
      { title = "Matthew Croughan / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2hk14jph2yhIa1xuY3exdQ"; tags = [ "youtube" ]; }
      { title = "Mav / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCL_BZpt0J9Kqwy6YPWr30ow"; tags = [ "youtube" ]; }
      { title = "Megadeth / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLVz1B001PIbq9LliJenV2w"; tags = [ "youtube" ]; }
      { title = "Met Office - Scotland Weather / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoMlx18yc7FjQB4R9jNfiTA"; tags = [ "youtube" ]; }
      { title = "Met Office - UK Weather / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC40Tw2tFuMzK305mi7nj8rg"; tags = [ "youtube" ]; }
      { title = "Metallica / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbulh9WdLtEXiooRcYK7SWw"; tags = [ "youtube" ]; }
      { title = "metfan4l / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCn2NocgSwkVoxyRaTpexsaw"; tags = [ "youtube" ]; }
      { title = "Michael Mullin / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCfELskIRioGQwAwJ0d5c38Q"; tags = [ "youtube" ]; }
      { title = "MillionDollarExtreme2 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCK1YDs3lB2ZzX5ef1v2IT7A"; tags = [ "youtube" ]; }
      { title = "Minecraft / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1sELGmy5jp5fQUugmuYlXQ"; tags = [ "youtube" ]; }
      { title = "minutephysics / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUHW94eEFW7hkUMVaZz4eDg"; tags = [ "youtube" ]; }
      { title = "MoonMan22 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCw0YI40nuGEYSJ-Ea4dgR9Q"; tags = [ "youtube" ]; }
      { title = "Mumbo Jumbo / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChFur_NwVSbUozOcF_F2kMg"; tags = [ "youtube" ]; }
      { title = "N-O-D-E / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCvrLvII5oxSWEMEkszrxXEA"; tags = [ "youtube" ]; }
      { title = "N9 Gaming / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2lpmMaLpzSShjtaj7EPdtg"; tags = [ "youtube" ]; }
      { title = "NASA / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLA_DiR1FfKNvjuUpBHmylQ"; tags = [ "youtube" ]; }
      { title = "NASA Jet Propulsion Laboratory / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCryGec9PdUCLjpJW2mgCuLw"; tags = [ "youtube" ]; }
      { title = "NASA Stennis / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcMaUeefGqJLtVJxmc81GIQ"; tags = [ "youtube" ]; }
      { title = "NASASpaceflight / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSUu1lih2RifWkKtDOJdsBA"; tags = [ "youtube" ]; }
      { title = "Nerdwriter1 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJkMlOu7faDgqh4PfzbpLdg"; tags = [ "youtube" ]; }
      { title = "Nessus / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCezNue0i_f1IUHKb-klmjWA"; tags = [ "youtube" ]; }
      { title = "NFKRZ / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC19xLluI7dG093Gmw57BhHw"; tags = [ "youtube" ]; }
      { title = "NixOS / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3vIimi9q4AT8EgxYp_dWIw"; tags = [ "youtube" ]; }
      { title = "Numberphile / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoxcjq-8xIDTYp3uz647V5A"; tags = [ "youtube" ]; }
      { title = "ObsidianAnt / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtiq6FTXiFKQm-wqMuRijgA"; tags = [ "youtube" ]; }
      { title = "Off the Cuff / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVwxO3DgsOrQllAV_hz9GxA"; tags = [ "youtube" ]; }
      { title = "Outdoor Life and Craft / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbIaRQEIQ6Wnvg5Hps2gRyw"; tags = [ "youtube" ]; }
      { title = "OverSimplified / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCNIuvl7V8zACPpTmmNIqP2A"; tags = [ "youtube" ]; }
      { title = "Ozin370 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4f4buqNx5NCVqvuU_ML7Ug"; tags = [ "youtube" ]; }
      { title = "Panchiko / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcbca_MnFMLrBXGYiRh1aNQ"; tags = [ "youtube" ]; }
      { title = "Pantera / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChTDORxN3YPmasEurM6kRoA"; tags = [ "youtube" ]; }
      { title = "Penguido / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgIDDSTz-5QDmZv-aUTWm2A"; tags = [ "youtube" ]; }
      { title = "PeterSripol / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7yF9tV4xWEMZkel7q8La_w"; tags = [ "youtube" ]; }
      { title = "Photonicinduction / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCl9OJE9OpXui-gRsnWjSrlA"; tags = [ "youtube" ]; }
      { title = "Primitive Technology / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAL3JXZSzSm8AlZyD3nQdBA"; tags = [ "youtube" ]; }
      { title = "Project Kamp / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcGXEidw0qjNdq7Gii8gHgg"; tags = [ "youtube" ]; }
      { title = "ProjectAir / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCPCw5ycqW0fme1BdvNqOxbw"; tags = [ "youtube" ]; }
      { title = "RanOutOnARail / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8XCmWXE2J5dF7wXkzUVHtw"; tags = [ "youtube" ]; }
      { title = "Retro Space HD / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZJgMAoS30yYoLOYUe_lAXQ"; tags = [ "youtube" ]; }
      { title = "RGV Aerial Photography / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQbKe0RZ62u47TZ8vmKNnRA"; tags = [ "youtube" ]; }
      { title = "Rick Beato / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJquYOG5EL82sKTfH9aMA9Q"; tags = [ "youtube" ]; }
      { title = "rikhaven / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLyoSg-0LzMLeg2gvhdCM-g"; tags = [ "youtube" ]; }
      { title = "Rob Scallon / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCyDZai57BfE_N0SaBkKQyXg"; tags = [ "youtube" ]; }
      { title = "Robbaz / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCN474WQPkqqhUbxhkXKieQw"; tags = [ "youtube" ]; }
      { title = "Robert Greene  / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC-qsP49Ai2GymJgyKX38l1w"; tags = [ "youtube" ]; }
      { title = "Robert Maddox / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8ui_J9ROP81qvp1my83KiA"; tags = [ "youtube" ]; }
      { title = "Rocket Lab / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsWq7LZaizhIi-c-Yo_bcpw"; tags = [ "youtube" ]; }
      { title = "Rseferino Orbiter Filmmaker / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCA2hZokM4_rGj-zDk8b7jVw"; tags = [ "youtube" ]; }
      { title = "RTGame / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCRC6cNamj9tYAO6h_RXd5xA"; tags = [ "youtube" ]; }
      { title = "Scorpu / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCCZ-Zej6FY4ukZaaUbize2A"; tags = [ "youtube" ]; }
      { title = "Scotland History Tours / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmSwBBdhuJ39zaA437NaeXA"; tags = [ "youtube" ]; }
      { title = "Scott Manley / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxzC4EngIsMrPmbm6Nxvb-A"; tags = [ "youtube" ]; }
      { title = "Sebastian Lague / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmtyQOKKmrMVaKuRXz02jbQ"; tags = [ "youtube" ]; }
      { title = "shiey / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpXwMqnXfJzazKS5fJ8nrVw"; tags = [ "youtube" ]; }
      { title = "Skinwalker Ranch / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbdCrlryyi5BxLSKl5SshjQ"; tags = [ "youtube" ]; }
      { title = "Slipknot / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOJZ1tna8yj8mAEITPkHNCQ"; tags = [ "youtube" ]; }
      { title = "Smarter Every Day 2 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8VkNBOwvsTlFjoSnNSMmxw"; tags = [ "youtube" ]; }
      { title = "SmarterEveryDay / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6107grRI4m0o2-emgoDnAA"; tags = [ "youtube" ]; }
      { title = "SpaceX / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtI0Hodo5o5dUb67FeUjDeA"; tags = [ "youtube" ]; }
      { title = "Stand-up Maths / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSju5G2aFaWMqn-_0YBtq5A"; tags = [ "youtube" ]; }
      { title = "StarshipBocaChica / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBfhGiuA7g8Uz0_V5rcJi4g"; tags = [ "youtube" ]; }
      { title = "Steve Wallis / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSnqXeK94-iNmwqGO__eJ5g"; tags = [ "youtube" ]; }
      { title = "Steve Wallis Step 2 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0PPuloGGVMIAOa42vpmn7Q"; tags = [ "youtube" ]; }
      { title = "Stratzenblitz75 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCTIgONilLxeAPqkiZrqZOzg"; tags = [ "youtube" ]; }
      { title = "styropyro / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJYJgj7rzsn0vdR7fkgjuIA"; tags = [ "youtube" ]; }
      { title = "SuestraGamingHD / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEQ9BidNTZHznJN_6UySZJw"; tags = [ "youtube" ]; }
      { title = "Syndicate / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1ieoHqKW-yYgDhLHIcx28w"; tags = [ "youtube" ]; }
      { title = "System Of A Down / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7-YMmnc0ppcWmio8t1WdcA"; tags = [ "youtube" ]; }
      { title = "Tango Tek / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4YUKOBld2PoOLzk0YZ80lw"; tags = [ "youtube" ]; }
      { title = "Tesla / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5WjFrtBdufl6CZojX3D8dQ"; tags = [ "youtube" ]; }
      { title = "The Graham Stephan Show / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCa-ckhlKL98F8YXKQ-BALiw"; tags = [ "youtube" ]; }
      { title = "The Modern Rogue / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC42VsoDtra5hMiXZSsD6eGg"; tags = [ "youtube" ]; }
      { title = "The New Pill / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCiUkcNS6W0n8QdosuZASduQ"; tags = [ "youtube" ]; }
      { title = "The Slow Mo Guys / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUK0HBIBWgM2c4vsPhkYY4w"; tags = [ "youtube" ]; }
      { title = "TheArea51Rider / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCDSTAK_guz2LuhmtwaiheIA"; tags = [ "youtube" ]; }
      { title = "ThePrimeagen / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8ENHE5xdFSwx71u3fDH5Xw"; tags = [ "youtube" ]; }
      { title = "ThePrimeTime / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUyeluBRhGPCW4rPe_UvBZQ"; tags = [ "youtube" ]; }
      { title = "theteachr / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCCLTbu1USKT91jZ6Td5XCKQ"; tags = [ "youtube" ]; }
      { title = "ThinMatrix / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUkRj4qoT1bsWpE_C8lZYoQ"; tags = [ "youtube" ]; }
      { title = "Thomas Frank / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCG-KntY7aVnIGXYEBQvmBAQ"; tags = [ "youtube" ]; }
      { title = "TJ DeVries / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCd3dNckv1Za2coSaHGHl5aA"; tags = [ "youtube" ]; }
      { title = "Tom Scott / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBa659QWEk1AI4Tg--mrJ2A"; tags = [ "youtube" ]; }
      { title = "Trevor Mahlmann / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCyMr3SoLYu-PeAINAL-50xA"; tags = [ "youtube" ]; }
      { title = "tripcode!Q/7 / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZrrEuHiQjN2CUo84g5tk7w"; tags = [ "youtube" ]; }
      { title = "Two Much Grian / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCDiznUV6dtdB9PQj__XVhnA"; tags = [ "youtube" ]; }
      { title = "under development / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCw26lfHpBp4spHXI9qTYbjg"; tags = [ "youtube" ]; }
      { title = "United Launch Alliance / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCnrGPRKAg1PgvuSHrRIl3jg"; tags = [ "youtube" ]; }
      { title = "USLaunchReport / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5hWqb0u1eKgYmVryCEyJYA"; tags = [ "youtube" ]; }
      { title = "VAGA VAGABOND / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCO8MMsO_XRjO7X4iGCuKdwg"; tags = [ "youtube" ]; }
      { title = "Vagrant Holiday / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgNqlRGqHdxNRPR6ycynWhw"; tags = [ "youtube" ]; }
      { title = "Van Neistat / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5mPJA4y5G8Z6aNkY6AxgAw"; tags = [ "youtube" ]; }
      { title = "Veritasium / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCHnyfMqiRRG1u-2MsSQLbXA"; tags = [ "youtube" ]; }
      { title = "videogamedunkey / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsvn_Po0SmunchJYOWpOxMg"; tags = [ "youtube" ]; }
      { title = "Vsauce / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6nSFpj9HTCZ5t-N3Rm3-HA"; tags = [ "youtube" ]; }
      { title = "Wendover Productions / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9RM-iSvTu1uPJb8X5yp3EQ"; tags = [ "youtube" ]; }
      { title = "Wolfgang's Channel / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsnGwSIHyoYN0kiINAGUKxg"; tags = [ "youtube" ]; }
      { title = "Xander Budnick / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCDoJIpPvtEwFvfNXsZvCqKw"; tags = [ "youtube" ]; }
      { title = "xisumasays / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCm6yD26HlafzqNlYaK7uEaA"; tags = [ "youtube" ]; }
      { title = "xisumavoid / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCU9pX8hKcrx06XfOB-VQLdw"; tags = [ "youtube" ]; }
      { title = "Yes Theory / YouTube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCvK4bOhULCpmLabd2pDMtnA"; tags = [ "youtube" ]; }
    ];
    extraConfig = ''
      highlight article "(^Feed:.*|^Title:.*|^Author:.*|^Date:.*|^Link:.*)" default default bold
      highlight article "(^Feed:|^Title:|^Author:|^Date:|^Link:)" green default bold
      text-width 80

      # Not having specific actions for *both* articles and feeds gets confusing.
      unbind-key o # default: open-in-browser (Use browser to open the URL associated with the current article, feed, or entry in the URL view)
      unbind-key A # default: mark-feed-read (Mark all articles in the CURRENTLY SELECTED FEED read)
      unbind-key C # default: mark-all-feeds-read (Mark articles in ALL FEEDS read)
      unbind-key N # default: toggle-article-read (Toggle the read flag for the currently selected article, and clear the delete flag if set)

      bind-key ^A mark-all-feeds-read feedlist
      bind-key ^A mark-feed-read articlelist
      bind-key m toggle-article-read articlelist
      bind-key j down
      bind-key k up
      bind-key j next articlelist
      bind-key k prev articlelist
      bind-key G end
      bind-key g home
      bind-key d pagedown
      bind-key u pageup
      bind-key l open
      bind-key h quit

      # https://www.ditig.com/256-colors-cheat-sheet
      color listnormal color240 default
      color listfocus color240 color235 bold
      color listnormal_unread red default bold
      color listfocus_unread red color235 bold
      color title red black bold
      color info white black bold
      color article white default
      feed-sort-order unreadarticlecount-asc
      macro v set browser "setsid -f mpv" ; open-in-browser ; set browser firefox

      datetime-format "%a %d %B %Y"
      feedlist-format "%4i %3U new • %t%> %l"
      articlelist-format "%4i %f %D • %t"
    '';
  };
}

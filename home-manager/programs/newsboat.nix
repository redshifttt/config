{ config, ... }:
{
  programs.newsboat = {
    enable = true;
    autoReload = true;
    reloadThreads = 4; # good measure
    urls = [
      # Blogs and misc feeds
      { url = "https://soda.privatevoid.net/num/blog/index.xml"; tags = [ "blog" ]; }
      { url = "https://lukesmith.xyz/index.xml"; tags = [ "blog" ]; }
      { url = "https://www.nasaspaceflight.com/feed/"; tags = [ "news" "space" ]; }
      { url = "https://www.nasaspaceflight.com/news/spacex/feed/"; tags = [ "news" "space" "spacex" ]; }
      { url = "https://gpanders.com/index.xml"; tags = [ "blog" ]; }

      # Don't judge me
      { title = "3blue1brown / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucyo_jab_esufrv4b17ajtaw"; tags = [ "youtube" ]; }
      { title = "adam savage’s tested / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucidjtjkmicpb9b1qf7qjeoa"; tags = [ "youtube" ]; }
      { title = "adventures with christian / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucj1ttljm7vdeytvhgwnnmbq"; tags = [ "youtube" ]; }
      { title = "andreas kling / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc3ts8comp645hzw9jsd3pqq"; tags = [ "youtube" ]; }
      { title = "andrew goetsch / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucgp64m-mg5yjeiae5awa3-w"; tags = [ "youtube" ]; }
      { title = "andrew huberman / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc2d2cmwxmovwx7giw1n3lig"; tags = [ "youtube" ]; }
      { title = "anton petrov / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucciq8wfcvoiimi-lfu8-cjq"; tags = [ "youtube" ]; }
      { title = "antvenom / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uck376qndlnzzdnhsnawuteg"; tags = [ "youtube" ]; }
      { title = "astronomy live / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucbhux1ynlq3dssqdxa7czng"; tags = [ "youtube" ]; }
      { title = "austin barnard / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucr7atcbljekmbni3id86bka"; tags = [ "youtube" ]; }
      { title = "austinmcconnell / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucbxqcz9k0nrruy0ukgqtdqq"; tags = [ "youtube" ]; }
      { title = "bacon_ / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uccybvorbgpzuxm-mlbt0wta"; tags = [ "youtube" ]; }
      { title = "bald and bankrupt / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucxdzs_ltffvn0fdht6kmoxa"; tags = [ "youtube" ]; }
      { title = "bdoubleo100 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uclu2e7s8atp6tg2galk9hgg"; tags = [ "youtube" ]; }
      { title = "better ideas / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uctuid5wfnn82gddy7dgaq7w"; tags = [ "youtube" ]; }
      { title = "bisqwit / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucktehwygckf-b2wo0rkwrcg"; tags = [ "youtube" ]; }
      { title = "blackrack / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc3hxlmzsw2wevzmghrhmezw"; tags = [ "youtube" ]; }
      { title = "boston dynamics / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc7vvhkefw4nogp8tydk7rcq"; tags = [ "youtube" ]; }
      { title = "bps.space / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucill8ozwuxnfyxie2svjhhg"; tags = [ "youtube" ]; }
      { title = "bushradical / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uco698vl13dip93yh0f4rc5q"; tags = [ "youtube" ]; }
      { title = "cape canaveral space force museum / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucwqojp4okmfg4j_opxquora"; tags = [ "youtube" ]; }
      { title = "carykh / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc9z7ezabkphemg0sp7rw44a"; tags = [ "youtube" ]; }
      { title = "caseyneistat / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uctinbf-q-fvtha0qrfqtgxq"; tags = [ "youtube" ]; }
      { title = "cgp grey / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc2c_jshtl725hvbm1arsv9w"; tags = [ "youtube" ]; }
      { title = "channel 5 with andrew callaghan / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc-aqkm7hunmmxjds371mswg"; tags = [ "youtube" ]; }
      { title = "choki / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucoojhqhvjtrm1obxx7xixha"; tags = [ "youtube" ]; }
      { title = "cody'sblab / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc2mjylovjrltsgp0_4urqrq"; tags = [ "youtube" ]; }
      { title = "cody'slab / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucu6msomnzhqibiockhua2aw"; tags = [ "youtube" ]; }
      { title = "colinfurze / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucp68_flety0o-n9qu6phsgw"; tags = [ "youtube" ]; }
      { title = "computerphile / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc9-y-6csu5wgm29i7jiwpna"; tags = [ "youtube" ]; }
      { title = "corridor crew / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucspfndqr88xcz80n-x7t0nq"; tags = [ "youtube" ]; }
      { title = "cosmic perspective / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uch3jrub_0od3efoutiig4jq"; tags = [ "youtube" ]; }
      { title = "count dankula / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc7sefwzyfmsm1tqwxfuotpq"; tags = [ "youtube" ]; }
      { title = "count dankula 2 : electric boogaloo / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucrlo8hu2lwamh6mjbq1falq"; tags = [ "youtube" ]; }
      { title = "creblestar / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucksndroshup6mla9-r322hg"; tags = [ "youtube" ]; }
      { title = "daily bald / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucb2gbnxosy3vbkssd58nvhq"; tags = [ "youtube" ]; }
      { title = "dancer / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uciwixrnoe4lm-tqxxj0ze9w"; tags = [ "youtube" ]; }
      { title = "danny2462 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc8dikwgu8wfzfk3xi3-zcrq"; tags = [ "youtube" ]; }
      { title = "denshivideo / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucnwga76xvvwdevtorzbiuig"; tags = [ "youtube" ]; }
      { title = "derek banas / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucwrxb5duk4cvshbx-rgzsgw"; tags = [ "youtube" ]; }
      { title = "docm77 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc4o9hke9jt5yahkunv3lxpq"; tags = [ "youtube" ]; }
      { title = "druaga1 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc-7i1gu1r6pxbsl87o-7yeq"; tags = [ "youtube" ]; }
      { title = "electroboom / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucj0-otvpf0wokeqt2z1heta"; tags = [ "youtube" ]; }
      { title = "epic spaceflight / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc3tyqvyvc62dqtqcjjd352a"; tags = [ "youtube" ]; }
      { title = "ethoslab / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucfkdep9si4rmhfwjw1vysma"; tags = [ "youtube" ]; }
      { title = "everyday astronaut / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc6ukru_wqj1r2hmty3lix5q"; tags = [ "youtube" ]; }
      { title = "forest anon / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucnptgadjlt7k93debw0oqxa"; tags = [ "youtube" ]; }
      { title = "gavin freeborn / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucjetj7ndnllezdlxv7kio0w"; tags = [ "youtube" ]; }
      { title = "geowizard / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucw5oruz4seuykug1xqcjfya"; tags = [ "youtube" ]; }
      { title = "ghost town living / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucejbdkfrqqi4tgzt9ylnt8g"; tags = [ "youtube" ]; }
      { title = "goodtimeswithscar / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucodknmk9owrtiyzdr_huslg"; tags = [ "youtube" ]; }
      { title = "gotbletu / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uckf4viqu3acnfzuk3krifwa"; tags = [ "youtube" ]; }
      { title = "graham stephan / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucv6kdgjskwaeckne5apa0aq"; tags = [ "youtube" ]; }
      { title = "great measures / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucttb5cxmadukug0_e7q13bw"; tags = [ "youtube" ]; }
      { title = "greg hurrell / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucxphfm88ilfn68omlwtpmza"; tags = [ "youtube" ]; }
      { title = "grian / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucr9gcq0cmm6ygtzsdxaxjoq"; tags = [ "youtube" ]; }
      { title = "hazegrayart / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uch2dnrlcnhds2iv9i2r58pw"; tags = [ "youtube" ]; }
      { title = "hell on earth / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucu0hvcbis1swtjm5kzlg6aq"; tags = [ "youtube" ]; }
      { title = "hermitcraft recap - a show by fans for fans / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc32w6ux5qtmutf4qqq2pkaq"; tags = [ "youtube" ]; }
      { title = "howtobasic / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucr4s1de9j4dhzzyxmltsmag"; tags = [ "youtube" ]; }
      { title = "hydewars / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucfuaz8ra7m7bqueacv2jysw"; tags = [ "youtube" ]; }
      { title = "incognito mode / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc8q7xey86q7t-3knpnjygwa"; tags = [ "youtube" ]; }
      { title = "integza / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc2avwdln1ei3r1rz_dlsxcw"; tags = [ "youtube" ]; }
      { title = "internet comment etiquette with erik / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucywdmyzrjrghekf-offst5q"; tags = [ "youtube" ]; }
      { title = "internet historian / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucr1d15p_vdp3hkrh8wgjqrw"; tags = [ "youtube" ]; }
      { title = "jacob sorber / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucwd5vfu4kojnjkwjzmfjghq"; tags = [ "youtube" ]; }
      { title = "jay foreman / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucbbqalj4oac0oq0aqraoj9g"; tags = [ "youtube" ]; }
      { title = "jerobeam fenderson 📟 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucecl4anz5hvurzw5fgcohkq"; tags = [ "youtube" ]; }
      { title = "jesús rodríguez valencia / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc3oics73_jhutdksma3gvpa"; tags = [ "youtube" ]; }
      { title = "jim browning / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucbng0osibaprvczz3ic84vw"; tags = [ "youtube" ]; }
      { title = "joe collins / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uctfabokd7yty6sdf4pobvqa"; tags = [ "youtube" ]; }
      { title = "joe grand / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucqgonxw1orgz5y4qk-0jdkq"; tags = [ "youtube" ]; }
      { title = "john randolph / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uch4dpghcn-fc8vjythnz8aq"; tags = [ "youtube" ]; }
      { title = "johnny harris / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucmgsjvg3mcrxvop4yzru1dw"; tags = [ "youtube" ]; }
      { title = "jonathan paulson / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucuwlim0l4sdpee28t41wita"; tags = [ "youtube" ]; }
      { title = "jonathan pie / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uco79nsde5fpmowuh1ycbfca"; tags = [ "youtube" ]; }
      { title = "jordan b peterson / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucl_f53zejxp8ttlokhwmv9q"; tags = [ "youtube" ]; }
      { title = "jordan b peterson clips / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucodkb-qbktji5nruspypf7g"; tags = [ "youtube" ]; }
      { title = "kai hendry / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucfzgynkxpaglnq28qwytdfa"; tags = [ "youtube" ]; }
      { title = "keralis / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uccjgoennb0ii4a_qi9omkra"; tags = [ "youtube" ]; }
      { title = "kerbal space program / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc-zlxbhkdi6m0iqggsnvtaw"; tags = [ "youtube" ]; }
      { title = "kolya the storyteller / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucen0k8ogt2_etatx_lhqrkw"; tags = [ "youtube" ]; }
      { title = "kris occhipinti / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucf93fpkwotph47h3_kdcryg"; tags = [ "youtube" ]; }
      { title = "kurzgesagt – in a nutshell / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucsxvk37blthxd1rdpwtnm8q"; tags = [ "youtube" ]; }
      { title = "labpadre space / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucfwmitskc1fms6pojoh1ouq"; tags = [ "youtube" ]; }
      { title = "lex fridman / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucshzkyawb77ixddsgog4iwa"; tags = [ "youtube" ]; }
      { title = "liambrown / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucxdk-l1efdz873nmcpm2xqa"; tags = [ "youtube" ]; }
      { title = "life of tom / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucfys3kyhdpozfwgv0a4sygq"; tags = [ "youtube" ]; }
      { title = "limmy / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucz8ql34vqn91fzq0xvg9pqg"; tags = [ "youtube" ]; }
      { title = "liveoverflow / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uclce-kvhqyihccjywcpfj9w"; tags = [ "youtube" ]; }
      { title = "luke smith / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc2eyfnh61tmytimy1mtyvha"; tags = [ "youtube" ]; }
      { title = "lunarmodule5 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc9jonm8jec_jdgf7ubfy2ga"; tags = [ "youtube" ]; }
      { title = "mark rober / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucy1kmzp36iqsynx_9h4mpcg"; tags = [ "youtube" ]; }
      { title = "markus persson / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucw4bscan7xulrlscnbrv9wa"; tags = [ "youtube" ]; }
      { title = "martijn doolaard / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uclkuhtjfbqbtgfs14h9vw5g"; tags = [ "youtube" ]; }
      { title = "matthew croughan / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc2hk14jph2yhia1xuy3exdq"; tags = [ "youtube" ]; }
      { title = "mav / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucl_bzpt0j9kqwy6ypwr30ow"; tags = [ "youtube" ]; }
      { title = "megadeth / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uclvz1b001pibq9llijenv2w"; tags = [ "youtube" ]; }
      { title = "met office - scotland weather / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucomlx18yc7fjqb4r9jnfita"; tags = [ "youtube" ]; }
      { title = "met office - uk weather / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc40tw2tfumzk305mi7nj8rg"; tags = [ "youtube" ]; }
      { title = "metallica / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucbulh9wdltexioorcyk7sww"; tags = [ "youtube" ]; }
      { title = "metfan4l / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucn2nocgswkvoxyratpexsaw"; tags = [ "youtube" ]; }
      { title = "michael mullin / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucfelskiriogqwawj0d5c38q"; tags = [ "youtube" ]; }
      { title = "milliondollarextreme2 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uck1yds3lb2zzx5ef1v2it7a"; tags = [ "youtube" ]; }
      { title = "minecraft / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc1selgmy5jp5fquugmuylxq"; tags = [ "youtube" ]; }
      { title = "minutephysics / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucuhw94eefw7hkumvazz4edg"; tags = [ "youtube" ]; }
      { title = "moonman22 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucw0yi40nugeysj-ea4dgr9q"; tags = [ "youtube" ]; }
      { title = "mumbo jumbo / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uchfur_nwvsbuozocf_f2kmg"; tags = [ "youtube" ]; }
      { title = "n-o-d-e / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucvrlvii5oxswemekszrxxea"; tags = [ "youtube" ]; }
      { title = "n9 gaming / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc2lpmmalpzsshjtaj7epdtg"; tags = [ "youtube" ]; }
      { title = "nasa / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucla_dir1ffknvjuupbhmylq"; tags = [ "youtube" ]; }
      { title = "nasa jet propulsion laboratory / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucrygec9pducljpjw2mgculw"; tags = [ "youtube" ]; }
      { title = "nasa stennis / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uccmaueefgqjltvjxmc81giq"; tags = [ "youtube" ]; }
      { title = "nasaspaceflight / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucsuu1lih2rifwkktdojdsba"; tags = [ "youtube" ]; }
      { title = "nerdwriter1 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucjkmlou7fadgqh4pfzbpldg"; tags = [ "youtube" ]; }
      { title = "nessus / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uceznue0i_f1iuhkb-klmjwa"; tags = [ "youtube" ]; }
      { title = "nfkrz / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc19xllui7dg093gmw57bhhw"; tags = [ "youtube" ]; }
      { title = "nixos / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc3viimi9q4at8egxyp_dwiw"; tags = [ "youtube" ]; }
      { title = "numberphile / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucoxcjq-8xidtyp3uz647v5a"; tags = [ "youtube" ]; }
      { title = "obsidianant / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uctiq6ftxifkqm-wqmurijga"; tags = [ "youtube" ]; }
      { title = "off the cuff / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucvwxo3dgsorqllav_hz9gxa"; tags = [ "youtube" ]; }
      { title = "outdoor life and craft / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucbiarqeiq6wnvg5hps2gryw"; tags = [ "youtube" ]; }
      { title = "oversimplified / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucniuvl7v8zacpptmmniqp2a"; tags = [ "youtube" ]; }
      { title = "ozin370 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc4f4buqnx5ncvqvuu_ml7ug"; tags = [ "youtube" ]; }
      { title = "panchiko / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uccbca_mnfmlrbxgyirh1anq"; tags = [ "youtube" ]; }
      { title = "pantera / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uchtdorxn3ypmaseurm6kroa"; tags = [ "youtube" ]; }
      { title = "penguido / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucgiddstz-5qdmzv-autwm2a"; tags = [ "youtube" ]; }
      { title = "petersripol / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc7yf9tv4xwemzkel7q8la_w"; tags = [ "youtube" ]; }
      { title = "photonicinduction / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucl9oje9opxui-grsnwjsrla"; tags = [ "youtube" ]; }
      { title = "primitive technology / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucal3jxzszsm8alzyd3nqdba"; tags = [ "youtube" ]; }
      { title = "project kamp / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uccgxeidw0qjndq7gii8ghgg"; tags = [ "youtube" ]; }
      { title = "projectair / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucpcw5ycqw0fme1bdvnqoxbw"; tags = [ "youtube" ]; }
      { title = "ranoutonarail / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc8xcmwxe2j5df7wxkzuvhtw"; tags = [ "youtube" ]; }
      { title = "retro space hd / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uczjgmaos30yyoloyue_laxq"; tags = [ "youtube" ]; }
      { title = "rgv aerial photography / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucqbke0rz62u47tz8vmknnra"; tags = [ "youtube" ]; }
      { title = "rick beato / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucjquyog5el82sktfh9ama9q"; tags = [ "youtube" ]; }
      { title = "rikhaven / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uclyosg-0lzmleg2gvhdcm-g"; tags = [ "youtube" ]; }
      { title = "rob scallon / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucydzai57bfe_n0sabkkqyxg"; tags = [ "youtube" ]; }
      { title = "robbaz / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucn474wqpkqqhubxhkxkieqw"; tags = [ "youtube" ]; }
      { title = "robert greene  / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc-qsp49ai2gymjgykx38l1w"; tags = [ "youtube" ]; }
      { title = "robert maddox / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc8ui_j9rop81qvp1my83kia"; tags = [ "youtube" ]; }
      { title = "rocket lab / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucswq7lzaizhii-c-yo_bcpw"; tags = [ "youtube" ]; }
      { title = "rseferino orbiter filmmaker / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uca2hzokm4_rgj-zdk8b7jvw"; tags = [ "youtube" ]; }
      { title = "rtgame / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucrc6cnamj9tyao6h_rxd5xa"; tags = [ "youtube" ]; }
      { title = "scorpu / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uccz-zej6fy4ukzaaubize2a"; tags = [ "youtube" ]; }
      { title = "scotland history tours / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucmswbbdhuj39zaa437naexa"; tags = [ "youtube" ]; }
      { title = "scott manley / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucxzc4engismrpmbm6nxvb-a"; tags = [ "youtube" ]; }
      { title = "sebastian lague / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucmtyqokkmrmvakurxz02jbq"; tags = [ "youtube" ]; }
      { title = "shiey / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucpxwmqnxfjzazks5fj8nrvw"; tags = [ "youtube" ]; }
      { title = "skinwalker ranch / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucbdcrlryyi5bxlskl5sshjq"; tags = [ "youtube" ]; }
      { title = "slipknot / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucojz1tna8yj8maeitpkhncq"; tags = [ "youtube" ]; }
      { title = "smarter every day 2 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc8vknbowvstlfjosnnsmmxw"; tags = [ "youtube" ]; }
      { title = "smartereveryday / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc6107grri4m0o2-emgodnaa"; tags = [ "youtube" ]; }
      { title = "spacex / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucti0hodo5o5dub67feujdea"; tags = [ "youtube" ]; }
      { title = "stand-up maths / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucsju5g2afawmqn-_0ybtq5a"; tags = [ "youtube" ]; }
      { title = "starshipbocachica / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucbfhgiua7g8uz0_v5rcji4g"; tags = [ "youtube" ]; }
      { title = "steve wallis / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucsnqxek94-inmwqgo__ej5g"; tags = [ "youtube" ]; }
      { title = "steve wallis step 2 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc0ppuloggvmiaoa42vpmn7q"; tags = [ "youtube" ]; }
      { title = "stratzenblitz75 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uctigonillxeapqkizrqzozg"; tags = [ "youtube" ]; }
      { title = "styropyro / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucjyjgj7rzsn0vdr7fkgjuia"; tags = [ "youtube" ]; }
      { title = "suestragaminghd / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uceq9bidntzhznjn_6uyszjw"; tags = [ "youtube" ]; }
      { title = "syndicate / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc1ieohqkw-yygdhlhicx28w"; tags = [ "youtube" ]; }
      { title = "system of a down / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc7-ymmnc0ppcwmio8t1wdca"; tags = [ "youtube" ]; }
      { title = "tesla / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc5wjfrtbdufl6czojx3d8dq"; tags = [ "youtube" ]; }
      { title = "the graham stephan show / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uca-ckhlkl98f8yxkq-baliw"; tags = [ "youtube" ]; }
      { title = "the new pill / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uciukcns6w0n8qdosuzasduq"; tags = [ "youtube" ]; }
      { title = "the slow mo guys / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucuk0hbibwgm2c4vsphkyy4w"; tags = [ "youtube" ]; }
      { title = "thearea51rider / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucdstak_guz2luhmtwaiheia"; tags = [ "youtube" ]; }
      { title = "theprimeagen / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc8enhe5xdfswx71u3fdh5xw"; tags = [ "youtube" ]; }
      { title = "theprimetime / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucuyelubrhgpcw4rpe_uvbzq"; tags = [ "youtube" ]; }
      { title = "theteachr / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uccltbu1uskt91jz6td5xckq"; tags = [ "youtube" ]; }
      { title = "thinmatrix / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucukrj4qot1bswpe_c8lzyoq"; tags = [ "youtube" ]; }
      { title = "thomas frank / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucg-knty7avnigxyebqvmbaq"; tags = [ "youtube" ]; }
      { title = "tj devries / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucd3dnckv1za2cosahghl5aa"; tags = [ "youtube" ]; }
      { title = "tom scott / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucba659qwek1ai4tg--mrj2a"; tags = [ "youtube" ]; }
      { title = "trevor mahlmann / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucymr3solyu-peainal-50xa"; tags = [ "youtube" ]; }
      { title = "tripcode!q/7 / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uczrreuhiqjn2cuo84g5tk7w"; tags = [ "youtube" ]; }
      { title = "two much grian / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucdiznuv6dtdb9pqj__xvhna"; tags = [ "youtube" ]; }
      { title = "under development / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucw26lfhpbp4sphxi9qtybjg"; tags = [ "youtube" ]; }
      { title = "united launch alliance / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucnrgprkag1pgvushrril3jg"; tags = [ "youtube" ]; }
      { title = "uslaunchreport / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc5hwqb0u1ekgymvryceyjya"; tags = [ "youtube" ]; }
      { title = "vaga vagabond / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uco8mmso_xrjo7x4igcukdwg"; tags = [ "youtube" ]; }
      { title = "vagrant holiday / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucgnqlrgqhdxnrpr6ycynwhw"; tags = [ "youtube" ]; }
      { title = "van neistat / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc5mpja4y5g8z6anky6axgaw"; tags = [ "youtube" ]; }
      { title = "veritasium / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uchnyfmqirrg1u-2mssqlbxa"; tags = [ "youtube" ]; }
      { title = "videogamedunkey / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucsvn_po0smunchjyowpoxmg"; tags = [ "youtube" ]; }
      { title = "vsauce / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc6nsfpj9htcz5t-n3rm3-ha"; tags = [ "youtube" ]; }
      { title = "wendover productions / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=uc9rm-isvtu1upjb8x5yp3eq"; tags = [ "youtube" ]; }
      { title = "wolfgang's channel / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucsngwsihyoyn0kiinagukxg"; tags = [ "youtube" ]; }
      { title = "xander budnick / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucdojippvtewfvfnxszvcqkw"; tags = [ "youtube" ]; }
      { title = "xisumasays / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucm6yd26hlafzqnlyak7ueaa"; tags = [ "youtube" ]; }
      { title = "xisumavoid / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucu9px8hkcrx06xfob-vqldw"; tags = [ "youtube" ]; }
      { title = "yes theory / youtube"; url = "https://www.youtube.com/feeds/videos.xml?channel_id=ucvk4bohulcpmlabd2pdmtna"; tags = [ "youtube" ]; }
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

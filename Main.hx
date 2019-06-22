package;

import sys.io.File;
import sys.FileSystem;

class Main {

	public static final RED="\033[0;31m";
	public static final NC="\033[0m";

	public function new() {

		var start = Sys.time();

		Sys.print('${RED}Starting${NC}\n\n');

		var total = 100000;
		var current = 0;
		for(i in 0...total){

			var s = Std.string(i);
			if(s.length < 5){
				while(s.length < 5){ s = "0"+s; }
			}

			var a = s.split("");
			var file = a.pop() + ".json";
			var path = a.join("/");

			// if(!FileSystem.exists(path)) FileSystem.createDirectory(path);
			
			// File.saveContent(path+file, "test");

			current++;
			// progressBar(current,total);
		}

		var end = Sys.time()-start;
		Sys.print('\n\nDone in ${end} seconds\n\n');
	}

	function progressBar(current:Int, total:Int){
		var _fill = '█';
		var _empty = '-';
		var _current = '';
		var _rest = '';

		var percentge = Std.int((current/total)*100);

		for(i in 0...percentge){
			_current += _fill;
		}
		for(i in 0...(100-current)){
			_rest += _empty;
		}
		var progress = '|${_current}${_rest}| ${percentge}%';
		Sys.stdout().writeString ('\r'+progress+' ');
		Sys.stdout().flush();
		Sys.print('');
	}

	static public function main() {
		var app = new Main();
	}
}
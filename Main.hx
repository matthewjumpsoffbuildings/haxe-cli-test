package;

class Main {

	public static final RED="\033[0;31m";
	public static final NC="\033[0m";

	public function new() {
		var total = 50;
		var current = 0;
		Sys.print('${RED}Starting${NC}\n\n');
		for(i in 0...total){
			Sys.sleep(0.1);
			current++;
			progressBar(current,total);
		}
		Sys.print('\n\nDone\n\n');
	}

	function progressBar(current:Int, total:Int){
		var _fill = '█';
		var _empty = '-';
		var _current = '';
		var _rest = '';
		for(i in 0...current){
			_current += _fill;
		}
		for(i in 0...(total-current)){
			_rest += _empty;
		}
		var progress = '|${_current}${_rest}| ${Std.int((current/total)*100)}%';
		Sys.stdout().writeString ('\r'+progress+' ');
		Sys.stdout().flush();
		Sys.print('');
	}

	static public function main() {
		var app = new Main();
	}
}
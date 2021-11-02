package co.micol.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;

public class AjaxTest implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// Json Type Data
		return "chart/ajaxTest2";
	}
}	

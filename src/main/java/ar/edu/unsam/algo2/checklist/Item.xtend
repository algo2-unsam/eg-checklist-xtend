package ar.edu.unsam.algo2.checklist

import org.eclipse.xtend.lib.annotations.Accessors

class Item {
	
	@Accessors String descripcion
	@Accessors boolean checked = false
	
	new(String _descripcion) {
		descripcion = descripcion
	}
	
	def toggleChecked() {
		checked = !checked
	}
	
}
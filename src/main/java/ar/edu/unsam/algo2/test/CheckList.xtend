package ar.edu.unsam.algo2.test

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class CheckList {
	
	@Accessors List<Item> items = newArrayList
	
	def agregarItem(String descripcion) {
		agregarItem(new Item(descripcion))
	}
	
	def agregarItem(Item item) {
		items.add(item)
	}
	
	def estaPendiente() {
		items.forall [ item | !item.checked ] 
	}
	
	def estaEnProgreso() {
		items.exists [ item | !item.checked ] && items.exists [ item | item.checked ]
	}
	
	def estaCompleta() {
		items.forall [ item | item.checked ] 
	}
	
}

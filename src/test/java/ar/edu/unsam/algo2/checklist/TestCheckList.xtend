package ar.edu.unsam.algo2.checklist

import ar.edu.unsam.algo2.checklist.CheckList
import ar.edu.unsam.algo2.checklist.Item
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestCheckList {

	CheckList miLista
	Item otroItem

	@Before
	def void initialize() {
		miLista = new CheckList()
		miLista.agregarItem("Un Item")
		otroItem = new Item("Otro item")
		miLista.agregarItem(otroItem)
	}

	@Test
	def testListaPendiente() {
		Assert.assertTrue(miLista.estaPendiente())
	}
	
	@Test
	def testListaNoEnProgreso() {
		Assert.assertFalse(miLista.estaEnProgreso())
	}
	
	@Test
	def void testListaNoCompleta() {
		Assert.assertFalse(miLista.estaCompleta())
	}
	
	@Test
	def void testListaEnProgreso() {
		otroItem.toggleChecked()
		Assert.assertTrue(miLista.estaEnProgreso())
	}
	
	@Test
	def void testListaNoPendiente() {
		otroItem.toggleChecked()
		Assert.assertFalse(miLista.estaPendiente())
	}
	
	@Test
	def void testListaCompleta() {
		miLista.items.forEach [ it.toggleChecked() ]
		Assert.assertTrue(miLista.estaCompleta())
	}
	
	@Test
	def testListaCeroPorciento() {
		Assert.assertEquals(0.0, miLista.porcentajeCompletitud, 0.0)
	}
	
	@Test
	def testListaCincuentaPorciento() {
		otroItem.toggleChecked()
		Assert.assertEquals(50.0, miLista.porcentajeCompletitud, 0.0)
	}
	
	@Test
	def testListaCienPorciento() {
		miLista.items.forEach [ it.toggleChecked() ]
		Assert.assertEquals(100.0, miLista.porcentajeCompletitud, 0.0)
	}


}

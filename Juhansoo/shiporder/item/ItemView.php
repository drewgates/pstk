<?php
namespace shiporder;

/**
 * This class describes the visual part of items.
 *
 * @author rasmus
 * @namespace shiporder
 */
class ItemView {
	
	/**
	 * This function builds the list of items.
	 *
	 * @access public
	 * @param mixed $parameters['item']
	 *        	the list of items according to the result of
	 *        	<code>getListOfType</code>...-method
	 * @return the parsed HTML-file
	 * @uses ROOT_FOLDER for setting the full path
	 */
	public function buildListOfItems($parameters) {
		require_once 'HTML/Template/IT.php';
		$tpl = new \HTML_Template_IT(ROOT_FOLDER . 'item');
		$tpl->loadTemplatefile('Item.html');
		foreach ( $parameters['item'] as $idItem => $item ) {
			$tpl->setCurrentBlock('item');
			$tpl->setVariable(array (
				'NAME' => $item['title']
			));
			$tpl->parse('item');
		}
		$tpl->setCurrentBlock('body');
		$tpl->setVariable(array (
				'TITLE' => 'Tooted'
		));
		$tpl->parse('body');
		return $tpl->get('body');
	}
}
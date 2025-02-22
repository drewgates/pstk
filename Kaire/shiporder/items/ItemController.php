<?php
namespace shiporder;

require_once dirname(__FILE__) . '/Settings.php';

/**
 * This class controls everything about items.
 * 
 * @author kaire
 * @namespace shiporder
 */
class ItemController {

	/**
	 * This function starts the processes with items.
	 * 
	 * @access public
	 * @author kaire
	 * @return string the parsed list of items
	 * @uses Item for data
	 * @uses ItemView for the visual part
	 */
	public static function start() {
		// get data
		require_once dirname(__FILE__) . '/Item.php';
		$items = \shiporder\Item::getListOfTypeItem(array ());

		// get view
		require_once dirname(__FILE__) . '/ItemView.php';
		$view = \shiporder\ItemView::buildListOfItems(array (
			'items' => $items
		));
		return $view;
	}

}

\shiporder\ItemController::start();
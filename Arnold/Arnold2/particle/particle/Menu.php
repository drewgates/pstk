<?php
namespace tuts;

/**
 * This class deals with the data of menus.
 *
 * @author kalmer:piiskop <pandeero@gmail.com>
 * @namespace tuts
 */
class Menu
{

	/**
	 *
	 * @access private
	 * @author kalmer:piiskop <pandeero@gmail.com>
	 * @var array[int] the raw data of menus
	 */
	private static $rawMenus = array(
		1 => array(
			'id' => 1,
			'type' => 'common'
		),
		2 => array(
			'id' => 2,
			'type' => 'side'
		),
	);
}
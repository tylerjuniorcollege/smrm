<?php
/**
 * SMRM - Social Media Relationship Manager
 * Admin Module 
 * 
 * @author Duane Jeffers <djef@tjc.edu>
 * @link http://github.com/tylerjuniorcollege/smrm
 * @copyright Copyright (c) 2014 Tyler Junior College. (http://tjc.edu)
 * @license MIT - http://github.com/tylerjuniorcollege/smrm/LICENSE
 **/

namespace Application\View\Helper;

use Zend\View\Helper\AbstractHelper;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;

class NetworkSidebar extends AbstractHelper {
	protected $databaseAdapter;

	public function __construct(Adapter $databaseAdapter) {
		$this->databaseAdapter = $databaseAdapter;
	}

	public function __invoke() {
		$sql = new Sql($this->databaseAdapter);
		$select = $sql->select('networks');
		$select->where(array('enabled' => 1))
			   ->order('networkid ASC');

		$statement = $sql->prepareStatementForSqlObject($select);
		$result = $statement->execute();
		
		return $this->getView()->partialLoop('sidebar-partial', $result);
	}
}
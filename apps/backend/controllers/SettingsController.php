<?php
/**
 * Created by Jacky.
 * User: Jacky
 * Date: 7/24/2015
 * Time: 4:58 PM
 * Project: carofw
 * File: SettingsController.php
 */

namespace Modules\Backend\Controllers;

use Phalcon\Db\Column;
use Phalcon\Db\Index;

class SettingsController extends ControllerBase
{
    public function indexAction()
    {

    }

    public function repairAction()
    {
        $tables = include __DIR__ . "/../../config/database_structures.php";

        foreach ($tables as $table_name => $table_data) {
            $exists = $this->db->tableExists($table_name);

            if ($exists) {
                $current_fields = $this->db->describeColumns($table_name);
                foreach ($table_data['fields'] as $field_name => $options) {
                    $exists_field = true;
                    foreach ($current_fields as $c_field) {
                        if ($c_field->getName() == $field_name) {
                            $exists_field = true;
                            break;
                        } else {
                            $exists_field = false;
                        }
                    }

                    if ($exists_field == true) {
                        $this->db->modifyColumn($table_name, null, new Column($field_name, $options));
                    } else {
                        $this->db->addColumn($table_name, null, new Column(
                            $field_name, $options));
                    }
                }

                $current_indexes = $this->db->describeIndexes($table_name);
                foreach ($table_data['indexes'] as $index => $index_data) {
                    $create_index = true;
                    foreach ($current_indexes as $c_index => $c_index_fields) {
                        if ($index == $c_index) {
                            if (
                                $index_data['fields'] != $c_index_fields->getColumns()
                                || $index_data['type'] != $c_index_fields->getType()) {
                                $this->db->dropIndex($table_name, null, $c_index);
                                $create_index = true;
                            } else {
                                $create_index = false;
                            }
                        }
                    }

                    if ($create_index == true) {
                        $this->db->addIndex($table_name, null, new Index($index, $index_data['fields'], $index_data['type']));
                    }
                }

            } else {
                $new_columns = array(
                    'columns' => array(
                        new Column(
                            'id',
                            array(
                                'type' => Column::TYPE_INTEGER,
                                'size' => 10,
                                'notNull' => true,
                                'autoIncrement' => true,
                                'unsigned' => true
                            )
                        ),
                        new Column(
                            'created',
                            array(
                                'type' => Column::TYPE_DATETIME,
                                'notNull' => true,
                            )
                        ),
                        new Column(
                            'user_created_id',
                            array(
                                'type' => Column::TYPE_INTEGER,
                                'size' => 10,
                                'notNull' => true
                            )
                        ),
                        new Column(
                            'deleted',
                            array(
                                'type' => Column::TYPE_INTEGER,
                                'size' => 1,
                                'notNull' => true,
                                'default' => 0
                            )
                        )
                    ),
                    'indexes' => array(
                        new Index('PRIMARY', array('id'))
                    )
                );

                foreach($table_data['fields'] as $field_name => $options) {
                    $new_columns['columns'][] = new Column($field_name, $options);
                }

                foreach($table_data['indexes'] as $index => $index_data) {
                    $new_columns['indexes'][] = new Index($index, $index_data['fields'], $index_data['type']);
                }

                $this->db->createTable($table_name, null, $new_columns);
            }
        }

        $this->flash->success('Repair success!');
        $this->response->redirect('/admin/settings');
    }

}
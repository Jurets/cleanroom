<?php

class m131127_222754_add_complect extends CDbMigration
{
	public function up(){
        $this->addColumn('storeattribute', 'is_kit', 'TINYINT(1) NOT NULL DEFAULT 0');
	}

	public function down(){
		echo "m131127_222754_add_complect does not support migration down.\n";
		return false;
	}

	
	// Use safeUp/safeDown to do migration with transaction
	/*public function safeUp() {
        $sql = 'CREATE TABLE storeproductkit(
                  id INT(11) NOT NULL AUTO_INCREMENT,
                  name VARCHAR(255) NOT NULL,
                  type TINYINT(4) NOT NULL,
                  display_on_front TINYINT(1) NOT NULL DEFAULT 1,
                  use_in_filter TINYINT(1) NOT NULL,
                  use_in_variants TINYINT(1) NOT NULL,
                  use_in_compare TINYINT(1) NOT NULL DEFAULT 0,
                  select_many TINYINT(1) NOT NULL,
                  position INT(11) DEFAULT 0,
                  required TINYINT(1) NOT NULL,
                  PRIMARY KEY (id),
                  INDEX display_on_front (display_on_front),
                  INDEX name (name),
                  INDEX position (position),
                  INDEX use_in_compare (use_in_compare),
                  INDEX use_in_filter (use_in_filter),
                  INDEX use_in_variants (use_in_variants)
                )
                ENGINE = MYISAM
                AUTO_INCREMENT = 20
                AVG_ROW_LENGTH = 28
                CHARACTER SET utf8
                COLLATE utf8_general_ci;';
	}

	public function safeDown()
	{
	} */
	
}
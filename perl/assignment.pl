# connecting to an existing database.
# if database does not exist, then it will be created
# creating a table PEOPLE
sub create_table{
    use DBI;
    use strict;
    my $driver   = "SQLite";
    my $database = "test.db";
    my $dsn = "DBI:$driver:dbname=$database";
    my $userid = "";
    my $password = "";
    my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 })
                          or die $DBI::errstr;
    my $stmt = qq(CREATE TABLE if not exists PEOPLE
          (ID INT PRIMARY KEY     NOT NULL,
           FIRST_NAME           TEXT,
           LAST_NAME           TEXT,
           HOME        CHAR(50)););
    my $rv = $dbh->do($stmt);
    $dbh->disconnect();
}

# inserting records in PEOPLE table
# if pk duplicates -> ignore
sub populate_table{
    use DBI;
    use strict;
    my $driver   = "SQLite";
    my $database = "test.db";
    my $dsn = "DBI:$driver:dbname=$database";
    my $userid = "";
    my $password = "";
    my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 })
                          or die $DBI::errstr;
    my $stmt = qq(INSERT OR IGNORE INTO PEOPLE (ID,FIRST_NAME,LAST_NAME,HOME)
          VALUES (1, 'Rose', 'Tyler', 'Earth'));
    my $rv = $dbh->do($stmt) or die $DBI::errstr;

    $stmt = qq(INSERT OR IGNORE INTO PEOPLE (ID,FIRST_NAME,LAST_NAME,HOME)
          VALUES (2, 'Zoe', 'Heriot', 'Space Station W3'));
    $rv = $dbh->do($stmt) or die $DBI::errstr;

    $stmt = qq(INSERT OR IGNORE INTO PEOPLE (ID,FIRST_NAME,LAST_NAME,HOME)
          VALUES (3, 'Jo', 'Grant', 'Earth'));
    $rv = $dbh->do($stmt) or die $DBI::errstr;

    $stmt = qq(INSERT OR IGNORE INTO PEOPLE (ID,FIRST_NAME,LAST_NAME,HOME)
          VALUES (4, 'Leela', '', 'Unspecified'));
    $rv = $dbh->do($stmt) or die $DBI::errstr;

    $stmt = qq(INSERT OR IGNORE INTO PEOPLE (ID,FIRST_NAME,LAST_NAME,HOME)
          VALUES (5, 'Romana', '', 'Gallifrey'));
    $rv = $dbh->do($stmt) or die $DBI::errstr;

    $stmt = qq(INSERT OR IGNORE INTO PEOPLE (ID,FIRST_NAME,LAST_NAME,HOME)
          VALUES (6, 'Clara', 'Oswald', 'Earth'));
    $rv = $dbh->do($stmt) or die $DBI::errstr;

    $stmt = qq(INSERT OR IGNORE INTO PEOPLE (ID,FIRST_NAME,LAST_NAME,HOME)
          VALUES (7, 'Adric', '', 'Alzarius'));
    $rv = $dbh->do($stmt) or die $DBI::errstr;

    $stmt = qq(INSERT OR IGNORE INTO PEOPLE (ID,FIRST_NAME,LAST_NAME,HOME)
          VALUES (8, 'Susan', 'Foreman', 'Gallifrey'));
    $rv = $dbh->do($stmt) or die $DBI::errstr;

    print "Table was populated with a sample data successfully\n";
    $dbh->disconnect();
}

# fetch and display records from PEOPLE table
sub print_table{
    use DBI;
    use strict;
    my $driver   = "SQLite";
    my $database = "test.db";
    my $dsn = "DBI:$driver:dbname=$database";
    my $userid = "";
    my $password = "";
    my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 })
                          or die $DBI::errstr;
    my $stmt = qq(SELECT id, FIRST_NAME, LAST_NAME, HOME  from PEOPLE;);
    my $sth = $dbh->prepare( $stmt );
    my $rv = $sth->execute() or die $DBI::errstr;
    while(my @row = $sth->fetchrow_array()) {
          print "ID = ". $row[0] . "\n";
          print "FIRST_NAME = ". $row[1] ."\n";
          print "LAST_NAME = ". $row[2] ."\n";
          print "HOME =  ". $row[3] ."\n\n";
    }
    $dbh->disconnect();
}

sub main{
    create_table();
    while (1) {
        print "To populate table, press: 1\nPrint table content, press: 2\nQuit, press: 'q'\n";
        my $input = <STDIN>;
        chomp $input;
        if($input == '1'){
            populate_table();
        }elsif($input == '2'){
            print_table();
        }elsif($input eq 'q'){
          exit;
        }else{
           print "wrong input\n\n";
        }
    }
}

main();

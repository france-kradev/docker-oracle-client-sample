
const oracledb = require('oracledb');

oracledb.outFormat = oracledb.OUT_FORMAT_OBJECT;

async function run() {

    let connection;
    const start = Date.now();
    try {
        connection = await oracledb.getConnection( {
            user          : "db_user",
            password      : 'db_password',
            connectString : "127.0.0.1:1521/db_name"
        });

        const result = await connection.execute('',
            {

            },{
                resultSet: true
            });

        console.log("GER RESULT:");
        const rows = await result.getRows(10);
        console.log(rows);
    } catch (err) {
        console.error(err);
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error(err);
            }
        }
    }
}

run();

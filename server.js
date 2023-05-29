const express = require('express');
const { exec } = require('child_process');

const app = express();
app.listen(process.env.PORT || 3000, '0.0.0.0', function() {
    console.log('Listening on port ' + (process.env.PORT || 3000));
    
    // After starting the server, start the Presearch node
    exec('/app/presearch-node', (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
    });
});

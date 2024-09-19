module.exports = async function(callback) {
    try {
        const MicroCredentialing = artifacts.require("MicroCredentialing");
        const instance = await MicroCredentialing.deployed();

        const accounts = await web3.eth.getAccounts();
        const userAddress = accounts[0];

        // Register User
        let registerReceipt = await instance.registerUser(false, false, true, { from: userAddress });
        console.log('User Registered:', registerReceipt);

        // Issue Credential
        let issueReceipt = await instance.issueCredential(userAddress, { from: userAddress });
        console.log('Credential Issued:', issueReceipt);

        // Verify Credential
        let isValid = await instance.verifyCredential(userAddress);
        console.log('Credential Valid:', isValid);

        // Revoke Credential
        let revokeReceipt = await instance.revokeCredential(userAddress, { from: userAddress });
        console.log('Credential Revoked:', revokeReceipt);

        callback();
    } catch (error) {
        console.error('Error executing script:', error);
        callback(error);
    }
};

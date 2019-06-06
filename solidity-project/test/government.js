var government = artifacts.require("government_factory");

contract("government_factory", function(accounts) {
  it("should assert true", function(done) {
    var government1 = government.deployed();
     console.log(government1); 
    assert.isTrue(true);
    done();
  });
});

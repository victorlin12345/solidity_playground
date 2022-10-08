1. NFT Contract  實作：實作盲盒，白名單，使用 Merkle Tree 驗證，完成 earlyMint function
- 1_merkle_tree.js (產生 merkle root: https://medium.com/my-blockchain-development-daily-journey/%E5%B0%87-merkle-trees%E7%94%A8%E6%96%BC-nft-%E7%99%BD%E5%90%8D%E5%96%AE-248a5c2c1570)
```
➜  week9 git:(main) ✗ npm install merkletreejs
➜  week9 git:(main) ✗ npm install keccak256
➜  week9 git:(main) ✗ node 1_merkle_tree.js
white list merkle tree
 └─ eeefd63003e0e702cb41cd0043015a6e26ddb38073cc6ffeb0ba3e808ba8c097
   ├─ 9d997719c0a5b5f6db9b8ac69a988be57cf324cb9fffd51dc2c37544bb520d65
   │  ├─ 5931b4ed56ace4c46b68524cb5bcbf4195f1bbaacbe5228fbd090546c88dd229
   │  └─ 999bf57501565dbd2fdcea36efa2b9aef8340a8901e3459f4a4c926275d36cdb
   └─ 4726e4102af77216b09ccd94f40daa10531c87c4d60bba7f3b3faf5ff9f19b3c
      ├─ 04a10bfd00977f54cc3450c9b25c9b3a502a089eba0097ba35fc33c4ea5fcb54
      └─ dfbe3e504ac4e35541bebad4d0e7574668e16fefa26cd4172f93e18b59ce9486
```
- 1_blind_box_nft.sol
2. 找一個 open source 智能合約做 case study，介紹應用場景、分析程式碼、有什麼特色或學習點？
- https://zombit.info/web3-dapp-coding-best-practices-guide/
- https://compound.finance/docs
3. 三選一： tokenlist / multichain / 0x prototcol 
- multichain: https://academy.binance.com/zt/articles/what-is-multichain-multi
4. (選修) 看影片並練習實作：Call、Delegate Call、New，並了解各自的應用時機
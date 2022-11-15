using System.Collections;
using System.Numerics;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class ERC20BalanceOfExample : MonoBehaviour
{
    [SerializeField]
    private TMP_Text _title;
    private BigInteger balanceOf;
    async void Start()
    {
        string chain = "polygon";
        string network = "testnet";
        string contract = "0x461089f45eDD7dAB76614651711b021439ca3835";
        string account = "0x8E7A5aF22aB3B208e2E2DD9cc2E0a26869c1dd17";
        

        balanceOf = await ERC20.BalanceOf(chain, network, contract, account);
        print(balanceOf); 
    }

    public void SetTitle()
    {
        _title.text = balanceOf.ToString();
    }
}

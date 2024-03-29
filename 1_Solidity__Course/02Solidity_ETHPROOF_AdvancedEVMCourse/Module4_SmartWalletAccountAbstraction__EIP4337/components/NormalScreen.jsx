import Account from "@/components/Account";
import Header from "@/components/Header";
import Receive from "@/components/Receive";
import Send from "@/components/Send";
import TransferERC20 from "@/components/TransferERC20";
import { ethers } from "ethers";
import { useEffect, useState } from "react";
import { Presets } from "userop";
import AccountInfo from "./contexts/AccountInfo";
import AccountBalance from "./contexts/AccountBalance";
import ERC20Record from "./ERC20Record";
import configfile from '../config.json';


export default function NormalScreen() {
    let privateKeyAA;
    const [refresh, setRefresh] = useState(false)
    const [userAddress, setuserAddress] = useState("");
    const [privateKey, setPrivateKey] = useState();
    const [balance, setBalance] = useState();

    // // // // original copied code 
    // // // // original copied code 
    // const [config, setConfig] = useState({
    //     rpcUrl: `https://api.stackup.sh/v1/node/${process.env.NEXT_PUBLIC_API_KEY}`,
    //     signingKey: privateKey,
    //     entryPoint: "0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789",
    //     simpleAccountFactory: "0x4fCCb94c16C519F2b568dE6f444442F10075Dc1e",
    //     paymaster: {
    //         rpcUrl: "https://api.stackup.sh/v1/paymaster/API_KEY",
    //         context: {},
    //     },
    // });

    // // //  my first code after changes
    // // //  my first code after changes
    // const [config, setConfig] = useState({
    //     rpcUrl: `https://api.stackup.sh/v1/node/b9dc7eabb072875e8dc5047f40964306b92af8361bed1d54dabb527d63c86066`,
    //     signingKey: privateKey ,
    //     entryPoint: "0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789",
    //     simpleAccountFactory: "0x4fCCb94c16C519F2b568dE6f444442F10075Dc1e",
    //     paymaster: {
    //         rpcUrl: "https://api.stackup.sh/v1/paymaster/b9dc7eabb072875e8dc5047f40964306b92af8361bed1d54dabb527d63c86066",
    //         context: {},
    //     },
    // });

    // // //  my second code after changes
    // // //  my second code after changes
    const [config, setConfig] = useState({
        rpcUrl: configfile.rpcUrl,
        signingKey: privateKey,
        entryPoint: configfile.entryPoint,
        simpleAccountFactory: configfile.simpleAccountFactory,
        paymaster: {
            rpcUrl: configfile.paymaster.rpcUrl,
            context: configfile.paymaster.context,
        },
    });
    

    
    async function init() {
        setRefresh(true)
        if (typeof window !== 'undefined') {
            privateKeyAA = localStorage.getItem('privateKeyAA');
            if (privateKeyAA == undefined) {
                privateKeyAA = new ethers.Wallet(ethers.utils.randomBytes(32)).privateKey;
                localStorage.setItem('privateKeyAA', privateKeyAA);
                setPrivateKey(privateKeyAA);

            }
            setPrivateKey(privateKeyAA);
            await address()
            await balanceOfAddress()
            setRefresh(false)
        }
    }

    async function address() {
        try {
            const simpleAccount = await Presets.Builder.SimpleAccount.init(
                new ethers.Wallet(privateKey),
                config.rpcUrl,
                config.entryPoint,
                config.simpleAccountFactory
            );
            const address = simpleAccount.getSender();
            console.log(`SimpleAccount address: ${address}`);
            setuserAddress(address);
        } catch (error) {
            console.log(error)
        }
    }

    async function balanceOfAddress() {
        const provider = new ethers.providers.JsonRpcProvider("https://rpc-mumbai.maticvigil.com");
        try {
            let bal = await provider.getBalance(userAddress);
            console.log(bal.toString());
            setBalance(ethers.utils.formatEther(bal.toString()));
        } catch (error) {
            console.log(error)
        }
    }
    useEffect(() => {
        init()
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [userAddress, balance, privateKey])

    useEffect(() => {
        setConfig(prevConfig => {
            return {
                ...prevConfig,
                signingKey: privateKey
            }
        })
    }, [privateKey])
    return (
        <AccountInfo.Provider value={userAddress}>
            <AccountBalance.Provider value={balance}>
                <div className="lg:mx-44 mx-4 px-10 bg-red-200 rounded-lg h-full">
                    <Header config={config} privateKey={privateKey} setPrivateKey={setPrivateKey} />
                    <div className="bg-white p-10 rounded-xl shadow-lg ">
                        <Account balance={balance} refresh={refresh} privateKey={privateKey} init={init} />
                        <div className="flex flex-wrap justify-center gap-14 pt-10">
                            <Send config={config} init={init} />
                            <Receive />
                        </div>
                    </div>
                    <div>
                        <div className="my-5 p-10 bg-green-400 shadow-lg rounded-2xl">
                            <ERC20Record config={config} />
                            <TransferERC20 config={config} init={init} />
                        </div>
                    </div>
                </div>
            </AccountBalance.Provider>
        </AccountInfo.Provider>
    );
}


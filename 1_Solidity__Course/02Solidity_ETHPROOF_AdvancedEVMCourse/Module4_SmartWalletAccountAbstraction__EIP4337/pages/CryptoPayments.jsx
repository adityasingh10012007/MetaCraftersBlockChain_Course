import React, { useState } from 'react'
import { Circle, CircleEnvironments, PaymentIntentCreationRequest } from "@circle-fin/circle-sdk";
import Header from '@/components/Header';

function ERC20Tokens() {

    console.log(" it is using  using the Circle API through the @circle-fin/circle-sdk library. ")

    const circle = new Circle(
        `${process.env.NEXT_PUBLIC_API_KEY_CIRCLE}`,
        CircleEnvironments.sandbox      // API base url
    );

    const [id, setId] = useState();
    const [masterId, setMasterId] = useState();

    async function getAccountConfig() {
        const configResp = await circle.management.getAccountConfig();
        console.log(configResp.data);
    }

    async function createCryptoPayment() {
        const reqBody = {
            amount: {
                amount: "1.00",
                currency: "USD"
            },
            settlementCurrency: "USD",
            paymentMethods: [
                {
                    type: "blockchain",
                    chain: "ETH"
                }
            ],
            idempotencyKey: 'ba943ff1-ca16-49b2-ba55-1057e70ca5c7'
        };
        const resp = await circle.cryptoPaymentIntents.createPaymentIntent(reqBody);
        console.log(resp.data);
        console.log(resp.data.data.id)
        setId(resp.data.data.id);

        // setId(resp.data.id)
    }
    async function getCryptoPayment() {
        try {
            const cryptoPayment = await circle.cryptoPaymentIntents.getPaymentIntent(id);
            console.log(cryptoPayment);
            setMasterId(cryptoPayment.data.data.amountPaid.currency)
        } catch (error) {
            console.log(error);
        }

    }
    return (
        <div>

            <div className="xl:px-90 md:px-4 sm:px-2 bg-orange-300 rounded-lg h-screen">
                <div className="lg:mx-44 mx-4 px-10 bg-black rounded-lg h-full">
                    <div className=" text-white " >
                        <Header  disable={true} />
                    </div>
                    <div className="py-8 px-4 bg-gradient-to-r from-green-400 to-blue-500 rounded-xl shadow-lg ">
                        <h1 className="text-3xl font-bold mb-6 text-white">
                            Welcome to Circle (USDC)
                        </h1>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div className="bg-purple-600 rounded-lg p-6">
                                <h2 className="text-xl font-semibold mb-4 text-white">Create a Crypto Payment</h2>
                                <button onClick={createCryptoPayment} className="w-full py-3 bg-green-400 text-white text-lg font-semibold rounded-lg hover:bg-green-500 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-opacity-50">
                                    Create Payment
                                </button>
                                {id && <p className="mt-4 text-white">Payment ID: {id}</p>}
                            </div>
                            <div className="bg-blue-600 rounded-lg p-6">
                                <h2 className="text-xl font-semibold mb-4 text-white">Retrieve Amount Paid</h2>
                                <button onClick={getCryptoPayment} className="w-full py-3 bg-yellow-400 text-white text-lg font-semibold rounded-lg hover:bg-yellow-500 focus:outline-none focus:ring-2 focus:ring-yellow-500 focus:ring-opacity-50">
                                    Retrieve Amount
                                </button>
                                {masterId && <p className="mt-4 text-white">Amount Paid in: {masterId}</p>}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default ERC20Tokens

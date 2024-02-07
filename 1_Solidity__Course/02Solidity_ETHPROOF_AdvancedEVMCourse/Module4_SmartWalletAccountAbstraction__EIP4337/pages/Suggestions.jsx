import Header from '@/components/Header'
import React, { useState } from 'react'
import Link from 'next/link';

function Suggestions() {
    const [showAdvanced, setShowAdvanced] = useState(false);
    return (
        <div className='mx-5'>
            <div className="xl:px-90 md:px-4 sm:px-2 bg-blue-200 rounded-lg h-screen">
                <div className="lg:mx-44 mx-4 px-10 bg-gray-500 rounded-lg h-full">
                    <Header disable={true} />
                    <div class="container mx-auto mt-8">
                    
                        <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-8">
                            <div class="col-span-1 bg-gradient-to-br from-purple-400 via-pink-500 to-red-500 text-white rounded-lg shadow-md p-8">
                                <h1 class="text-2xl font-bold mb-4">Cryptocurrencies: Digital Currency Revolution</h1>
                                <p class="mb-4">Enter the world of cryptocurrencies, a groundbreaking form of digital money.</p>
                                <ul class="list-disc pl-6 mb-4">
                                    <li>Manage your digital wallet just like handling a bank account.</li>
                                    <li>Safeguard your private key as it serves as the gateway to your funds.</li>
                                    <li>Keep your private key confidential to ensure the security of your assets.</li>
                                    <li>Fund your account using your bank account or explore alternative methods.</li>
                                    <li>Obtain MATIC from <a href="https://faucet.polygon.technology/" class="underline">this source</a>.</li>
                                </ul>
                                <h2 class="text-lg font-semibold mb-4">Advanced Management</h2>
                                <ol class="list-decimal pl-6">
                                    <li class="mb-2">Import your key into MetaMask for streamlined access.</li>
                                    <li class="mb-2">Control the access permissions to your account.</li>
                                    <li>Set specific criteria for authorized fund transfers.</li>
                                </ol>
                            </div>
                            <div class="col-span-1 bg-gradient-to-br from-blue-400 via-green-500 to-teal-500 text-white rounded-lg shadow-md p-8">
                                <h1 class="text-2xl font-bold mb-4">Fortify Your Digital Assets</h1>
                                <p class="mb-4">Strengthen the security of your cryptocurrency investments with robust measures.</p>
                                <ul class="list-disc pl-6 mb-4">
                                    <li>Opt for trusted wallets such as MetaMask or Ledger for added assurance.</li>
                                    <li>Enhance security with two-factor authentication for additional layers of protection.</li>
                                    <li>Regularly back up your wallet and store the backups securely.</li>
                                    <li>Remain vigilant against phishing attempts and always verify transactions.</li>
                                    <li>Consider utilizing hardware wallets to bolster security measures.</li>
                                </ul>
                                <h2 class="text-lg font-semibold mb-4">Stay Updated</h2>
                                <p>Keep abreast of the latest developments and market trends to make informed decisions.</p>
                            </div>
                            <div class="col-span-1 bg-gradient-to-br from-yellow-400 via-orange-500 to-red-500 text-white rounded-lg shadow-md p-8">
                                <h1 class="text-2xl font-bold mb-4">Initiate Intelligent Investments</h1>
                                <p class="mb-4">Embark on your cryptocurrency investment journey with strategic steps.</p>
                                <ol class="list-decimal pl-6 mb-4">
                                    <li>Create accounts on reputable cryptocurrency exchanges to begin.</li>
                                    <li>Conduct thorough research to select promising investment options.</li>
                                    <li>Start with conservative investments and gradually diversify your portfolio.</li>
                                    <li>Regularly assess your investments and adjust your strategies accordingly.</li>
                                    <li>Practice patience and avoid impulsive decisions influenced by market fluctuations.</li>
                                </ol>
                                <h2 class="text-lg font-semibold mb-4">Seek Expert Counsel</h2>
                                <p>Consider seeking advice from financial experts or cryptocurrency professionals for tailored guidance.</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    )
}

export default Suggestions
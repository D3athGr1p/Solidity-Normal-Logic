// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

interface ISwapRouter {
    struct ExactInputSingleParams {
        address tokenIn;
        address tokenOut;
        uint24 fee;
        address recipient;
        uint256 deadline;
        uint256 amountIn;
        uint256 amountOutMinimum;
        uint160 sqrtPriceLimitX96;
    }

    function exactInputSingle(ExactInputSingleParams calldata params) external payable returns (uint256 amountOut);
    function refundETH() external payable;
}

interface IERC20 {
    function approve(address spender, uint256 amount) external returns (bool);
}


contract SwapTokens {
    address public uinswapV3RouterAddress = 0xE592427A0AEce92De3Edee1F18E0157C05861564;
    address public daiToken = 0xE592427A0AEce92De3Edee1F18E0157C05861564;
    address public wethAddress = 0xE592427A0AEce92De3Edee1F18E0157C05861564;

	function buyWeth(uint amountUSD) internal {
		uint256 deadline = block.timestamp + 15;
		uint24 fee = 3000;
		address recipient = address(this);
		uint256 amountIn = amountUSD; // includes 18 decimals
		uint256 amountOutMinimum = 0;
		uint160 sqrtPriceLimitX96 = 0;
		require(IERC20(daiToken).approve(address(uinswapV3RouterAddress), amountIn), 'DAI approve failed');
		
    ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams(
			daiToken,
			wethAddress,
			fee,
			recipient,
			deadline,
			amountIn,
			amountOutMinimum,
			sqrtPriceLimitX96
		);
		ISwapRouter(uinswapV3RouterAddress).exactInputSingle(params);
		ISwapRouter(uinswapV3RouterAddress).refundETH();
	}
}
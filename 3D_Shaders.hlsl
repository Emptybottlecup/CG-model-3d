cbuffer cbChangesEveryFrame : register(b0)
{
    matrix worldMatrix;
    matrix viewMatrix;
    matrix projMatrix;
};

struct VS_Input
{
    float4 pos : POSITION;
};

struct PS_Input
{
    float4 pos : SV_POSITION;
};

PS_Input VS_Main(VS_Input vertex)
{
    PS_Input vsOut = (PS_Input) 0;
    vsOut.pos = mul(vertex.pos, worldMatrix);
    vsOut.pos = mul(vsOut.pos, viewMatrix);
    vsOut.pos = mul(vsOut.pos, projMatrix);
    return vsOut;
}

float4 PS_Main(PS_Input frag) : SV_TARGET
{
    return float4(0, 1, 0, 0);
}
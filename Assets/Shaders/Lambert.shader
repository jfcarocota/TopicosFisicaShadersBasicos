Shader "Custom/Lambert"
{
	Properties
	{
		_MainTex("MainTex", 2D) = "white" {}
		_Albedo("Albedo", Color) = (1, 1, 1, 1)
		_BumpTex("Normal", 2D) = "bump" {}
		_NormalAmount("Normal Amount", Range(-3, 3)) = 1
		_AOTex("Ambient Occlusion", 2D) = "white" {}
	}

	SubShader
	{
		CGPROGRAM

		#pragma surface surf Lambert

		sampler2D _MainTex;
		sampler2D _BumpTex;
		sampler2D _AOTex;
		half4 _Albedo;
		float _NormalAmount;

		struct Input
		{
			float2 uv_MainTex;
			float2 uv_BumpTex;
			float2 uv_AOTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _Albedo.rbg;
			float3 normal = UnpackNormal(tex2D(_BumpTex, IN.uv_BumpTex));
			normal.z = normal.z / _NormalAmount;
			o.Normal = normal;
			//o.Occlusion = tex2D(_AOTex, IN.uv_AOTex);
		}

		ENDCG
	}

}

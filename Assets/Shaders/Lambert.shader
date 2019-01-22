Shader "Custom/Lambert"
{
	Properties
	{
		_MainTex("MainTex", 2D) = "white" {}
		_Albedo("Albedo", Color) = (1, 1, 1, 1)
	}

	SubShader
	{
		CGPROGRAM

		#pragma surface surf Lambert

		sampler2D _MainTex;
		half4 _Albedo;

		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _Albedo.rbg;
		}

		ENDCG
	}

}

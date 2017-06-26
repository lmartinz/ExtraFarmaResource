xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace S = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace con1= "http://www.bea.com/wli/sb/stages/transform/config";

declare namespace ctx= "http://www.bea.com/wli/sb/context";

declare function local:CriarFault($faultDetail as element(*)) as element(*) {
  <S:Fault xmlns:ns4="http://www.w3.org/2003/05/soap-envelope">
    	<faultcode xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">{concat('SOAP-ENV:',data($faultDetail/ctx:errorCode))}</faultcode>
	    {
	    if (fn:exists($faultDetail//con1:ReceivedFaultDetail/con1:faultstring) = fn:true() and $faultDetail//con1:ReceivedFaultDetail/con1:faultstring != '')
	    then <faultstring>{data($faultDetail//con1:ReceivedFaultDetail/con1:faultstring)}</faultstring>
		else
			if (fn:exists($faultDetail//con1:ReceivedFaultDetail/con1:detail) = fn:true()) 
			then <faultstring>{data($faultDetail//con1:ReceivedFaultDetail/con1:detail)}</faultstring>
			else <faultstring>Ocorreu um erro inesperado no OSB. ErrorCode: {data($faultDetail/ctx:errorCode)} Reason: {data($faultDetail/ctx:reason)} Node: {data($faultDetail/ctx:location/ctx:node)} Path: {data($faultDetail/ctx:location/ctx:path)}</faultstring>
		}
		<detail>{$faultDetail}</detail>
	</S:Fault>    
};

declare variable $faultDetail as element(*) external;
local:CriarFault($faultDetail)

xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace S = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace con1= "http://www.bea.com/wli/sb/stages/transform/config";

declare namespace ctx= "http://www.bea.com/wli/sb/context";

declare function local:CriarFault($faultDetail as element(*)) as element(*) {
<Fault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://canonico.ultra.com.br/infcorp/v1 v1/Resources/Fault.xsd"
       xmlns="http://canonico.ultra.com.br/infcorp/v1">
      <codigo xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">{concat('SOAP-ENV:',data($faultDetail/ctx:errorCode))}</codigo>
      {
      if (fn:exists($faultDetail//con1:ReceivedFaultDetail/con1:faultstring) = fn:true() and $faultDetail//con1:ReceivedFaultDetail/con1:faultstring != '')
       then <mensagem> {data($faultDetail//con1:ReceivedFaultDetail/con1:faultstring)} </mensagem>
       else()
      }
      <detalhe>Ocorreu um erro inesperado no OSB. ErrorCode: {data($faultDetail/ctx:errorCode)} Reason: {data($faultDetail/ctx:reason)} Node: {data($faultDetail/ctx:location/ctx:node)} Path: {data($faultDetail/ctx:location/ctx:path)}</detalhe>
      <tipo>ERRO_DE_SISTEMA</tipo>
    </Fault>        
         
};

declare variable $faultDetail as element(*) external;
local:CriarFault($faultDetail)

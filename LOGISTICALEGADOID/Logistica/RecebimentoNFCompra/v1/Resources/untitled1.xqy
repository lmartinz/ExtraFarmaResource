xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.oracle.com/retail/integration/rib/RibMessages";
(:: import schema at "../Schemas/RecebimentoNFCompraRibMessage.xsd" ::)

declare variable $input as element() (:: schema-element(ns1:RibMessages) ::) external;

declare function local:func($input as element() (:: schema-element(ns1:RibMessages) ::)) as text() {
    text {"stub"}
};

local:func($input)

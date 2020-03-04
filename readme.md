# PoC Mapping (skos) terms to an information model (Archimate concepts)

This proof of concepts demonstrates the a trivial mapping using a sparqlmotion endpoint in topbraid Composer. There are 4 key files in this repository

1.	Proxies > archimate_3.ttl. This is a semantic (RDF) version of the Archimate exchange format specification (see resources) and created in Topbraid composer using the export functionality
2.	endpoint.sms.ttl this file describes the sparqlmotion endpoint 
3.	export.sms.ttl this file describes the sparqlmotion steps (use this file for debugging sparqlmotion)
4.	converter.ttl this file is used for the mapping using rule based inferencing (SPIN)

Here are a couple of findings (mappingwise) during the PoC:
-	SKOS broader and narrow relations are less formal then Archimate relations but could be more expressive.
-	terms are based on a certain context (scheme) the notion of such a context is semantically different in Archimate (views and viewpoints)
-	Archimate profiles are not part of the Archimate exchange format and therefore not able to be mapped.

Some gotchas:
-	an instance of sxml:Document is needed when using sparqlmotion in contrast with manually inferencing in Composer. This instance is manually added in the converter. (See: https://groups.google.com/forum/#!topic/topbraid-users/_oZ3rypyYCg)
-	sxml:order can’t be use for the xml order but composite:index need to be used instead
-	converting sxml to xml outputs qualified names where unqualified names are needed (according to the XSD). This is solved by a XSLT.

## Usage:
1.	open the project in Topbraid Composer 
2.	navigate to the following address in your web browser:http://localhost:8083/tbl/sparqlmotion?id=skos2archimate&begrippenkader=im
3.	download the content
4.	open an Archimate aware editor (tested in Archi and Bizzdesign) and import the downloaded content

### Change the mapping
1.	open converter.ttl
2.	go to Model > display SPIN rules and Constraints
3.	select the mapping rule in the SPIN Overview window
4.	CTRL+click on converter:mapping
5.	You will see the rule in the spin:body property

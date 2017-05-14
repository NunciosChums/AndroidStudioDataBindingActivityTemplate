<?xml version="1.0"?>
<recipe>
    <#if screenType == "Activity">
        <merge from="root/src/app_package/AndroidManifest.xml.ftl"
                 to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
        <merge from="root/src/app_package/strings.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
    </#if>

    <instantiate from="root/src/app_package/layout.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate from="root/src/app_package/Screen.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${screenClass}.java" />

    <instantiate from="root/src/app_package/ViewModel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${viewModelClass}.java" />

   <instantiate from="root/src/app_package/Navigator.java.ftl"
                  to="${escapeXmlAttribute(srcOut)}/${navigatorClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${screenClass}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
    <open file="${escapeXmlAttribute(srcOut)}/${viewModelClass}.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${navigatorClass}.java" />
</recipe>

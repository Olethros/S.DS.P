# Add any types that are used by transforms
# CSharp types added via Add-Type are supported

'Load','Save' | ForEach-Object {
    $TransformName = 'ENTER-NAME'
    #add attributes that can be used with this transform
    $SupportedAttributes = @()
    $Action = $_
    # This is mandatory definition of transform that is expected by transform architecture
    $prop=[Ordered]@{
        Name=$TransformName
        Action=$Action
        SupportedAttributes=$SupportedAttributes
        Transform = $null
    }
    $codeBlock = new-object PSCustomObject -property $prop
    switch($Action)
    {
        "Load"
        {
            #transform that executes when loading attribute from LDAP server
            $codeBlock.Transform = { 
                param(
                [object[]]$Values
                )
                Process
                {
                    foreach($Value in $Values)
                    {
                        #implement a transform
                        #input values will always come as an array of objects - cast as needed
                    }
                }
            }
            $codeBlock
            break;
        }
        "Save"
        {
            #transform that executes when loading attribute from LDAP server
            $codeBlock.Transform = { 
                param(
                [object[]]$Values
                )
                
                Process
                {
                    foreach($Value in $Values)
                    {
                        #implement a transform used when saving attribute value
                        #input value type here depends on what comes from Load-time transform - update parameter type as needed
                    }
                }
            }
            $codeBlock
            break;
        }
    }
}

/*
 * Copyright 2010, Institute of Geological & Nuclear Sciences Ltd or
 * third-party contributors as indicated by the @author tags.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
package nz.org.geonet.hazbus.event.xslt.functionaltests;

import java.util.HashMap;
import java.util.Map;
import org.custommonkey.xmlunit.XMLUnit;
import org.mule.api.MuleMessage;
import org.mule.module.client.MuleClient;
import org.mule.tck.FunctionalTestCase;
import org.mule.util.IOUtils;

/**
 *
 * @author Geoff Clitheroe
 */
public class TransformerTest extends FunctionalTestCase {

    @Override
    protected String getConfigResources() {
        return "conf/mule-testing-config.xml";
    }

    public void testSC3ToSimpleEventTransform() throws Exception {
        XMLUnit.setIgnoreWhitespace(true);
        XMLUnit.setIgnoreComments(true);

        String srcData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/3266622.ms.xml", getClass());
        String resultData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/simple-event.xml", getClass());

        MuleClient client = new MuleClient();

        Map props = new HashMap();

        MuleMessage message = client.send("vm://sc3-v0.3-to-simple-event.in", srcData, props);

        assertNotNull("Got message", message);
        assertNull("Got no exceptions", message.getExceptionPayload());
        assertTrue("Transformed sc3 = simple event", XMLUnit.compareXML(message.getPayloadAsString(), resultData).similar());
    }

    public void testSC3ToSimpleEventTransformDT1() throws Exception {
        XMLUnit.setIgnoreWhitespace(true);
        XMLUnit.setIgnoreComments(true);

        String srcData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/3266622-dt1.ms.xml", getClass());
        String resultData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/simple-event-dt1.xml", getClass());

        MuleClient client = new MuleClient();

        Map props = new HashMap();

        MuleMessage message = client.send("vm://sc3-v0.3-to-simple-event.in", srcData, props);

        assertNotNull("Got message", message);
        assertNull("Got no exceptions", message.getExceptionPayload());
        assertTrue("Transformed sc3 = simple event", XMLUnit.compareXML(message.getPayloadAsString(), resultData).similar());
    }

    public void testSC3ToSimpleEventTransformDT2() throws Exception {
        XMLUnit.setIgnoreWhitespace(true);
        XMLUnit.setIgnoreComments(true);

        String srcData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/3266622-dt2.ms.xml", getClass());
        String resultData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/simple-event-dt2.xml", getClass());

        MuleClient client = new MuleClient();

        Map props = new HashMap();

        MuleMessage message = client.send("vm://sc3-v0.3-to-simple-event.in", srcData, props);

        assertNotNull("Got message", message);
        assertNull("Got no exceptions", message.getExceptionPayload());
        assertTrue("Transformed sc3 = simple event", XMLUnit.compareXML(message.getPayloadAsString(), resultData).similar());
    }

    public void testSC3ToSimpleEventTransformDT3() throws Exception {
        XMLUnit.setIgnoreWhitespace(true);
        XMLUnit.setIgnoreComments(true);

        String srcData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/3266622-dt3.ms.xml", getClass());
        String resultData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/simple-event-dt3.xml", getClass());

        MuleClient client = new MuleClient();

        Map props = new HashMap();

        MuleMessage message = client.send("vm://sc3-v0.3-to-simple-event.in", srcData, props);

        assertNotNull("Got message", message);
        assertNull("Got no exceptions", message.getExceptionPayload());
        assertTrue("Transformed sc3 = simple event", XMLUnit.compareXML(message.getPayloadAsString(), resultData).similar());
    }

    public void testSC3v05ToSimpleEventTransform() throws Exception {
        XMLUnit.setIgnoreWhitespace(true);
        XMLUnit.setIgnoreComments(true);

        String srcData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/2011a440804.xml", getClass());
        String resultData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/2011a440804-simple.xml", getClass());

        MuleClient client = new MuleClient();

        Map props = new HashMap();

        MuleMessage message = client.send("vm://sc3-v0.5-to-simple-event.in", srcData, props);

        assertNotNull("Got message", message);
        assertNull("Got no exceptions", message.getExceptionPayload());
        assertTrue("Transformed sc5 = simple event", XMLUnit.compareXML(message.getPayloadAsString(), resultData).similar());
    }

    public void testSC3v05ToSimpleDuplicateEventTransform() throws Exception {
        XMLUnit.setIgnoreWhitespace(true);
        XMLUnit.setIgnoreComments(true);

        String srcData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/2011a440804-duplicate.xml", getClass());
        String resultData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/2011a440804-duplicate-simple.xml", getClass());

        MuleClient client = new MuleClient();

        Map props = new HashMap();

        MuleMessage message = client.send("vm://sc3-v0.5-to-simple-event.in", srcData, props);

        assertNotNull("Got message", message);
        assertNull("Got no exceptions", message.getExceptionPayload());
        assertTrue("Transformed sc5 = simple event", XMLUnit.compareXML(message.getPayloadAsString(), resultData).similar());
    }

    public void testSC3v05ToSimpleAutomaticEventTransform() throws Exception {
        XMLUnit.setIgnoreWhitespace(true);
        XMLUnit.setIgnoreComments(true);

        String srcData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/2011a440804-automatic.xml", getClass());
        String resultData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/2011a440804-automatic-simple.xml", getClass());

        MuleClient client = new MuleClient();

        Map props = new HashMap();

        MuleMessage message = client.send("vm://sc3-v0.5-to-simple-event.in", srcData, props);

        assertNotNull("Got message", message);
        assertNull("Got no exceptions", message.getExceptionPayload());
        assertTrue("Transformed sc5 = simple event", XMLUnit.compareXML(message.getPayloadAsString(), resultData).similar());
    }

    public void testSC3v05ToSimpleDeletedEventTransform() throws Exception {
        XMLUnit.setIgnoreWhitespace(true);
        XMLUnit.setIgnoreComments(true);

        String srcData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/2011a440804-deleted.xml", getClass());
        String resultData = IOUtils.getResourceAsString(
                "nz/org/geonet/hazbus/event/xslt/sc3/2011a440804-deleted-simple.xml", getClass());

        MuleClient client = new MuleClient();

        Map props = new HashMap();

        MuleMessage message = client.send("vm://sc3-v0.5-to-simple-event.in", srcData, props);

        assertNotNull("Got message", message);
        assertNull("Got no exceptions", message.getExceptionPayload());
        assertTrue("Transformed sc5 = simple event", XMLUnit.compareXML(message.getPayloadAsString(), resultData).similar());
    }
}
/**
 * @author kalmer
 * @var string the status: either
 *      <ul>
 *      <li>empty,</li>
 *      <li><code>victimAtHome</code></li>,
 *      <li><code>victimNotAtHome</code></li>,
 *      <li><code>victimAgrees</code> or</li>
 *      <li><code>victimReachable</code></li>
 *      </ul>
 */
var status;

/**
 * This function calculates whether the victim will be evicted or not.
 */
function calculateEviction() {
	var checkbox = document.getElementById("checkboxForEviction");
	document.getElementById("answer").innerHTML = 'Kas võib ohvri välja tõsta? Selle teadasaamiseks vastan küsimusele.';
	if (!status) {
		if (checkbox.checked === true) {
			status = "victimAtHome";
			document.getElementById("labelInEviction").innerHTML = "Ohver on kodus. Kuid kas ta on ka väljatõstmisega nõus?";
			document.getElementById("buttonInEviction").innerHTML = "Kas ohvri võib välja tõsta?";
		} else {
			status = "victimNotAtHome";
			document.getElementById("labelInEviction").innerHTML = "Ohver pole kodus. Kas ta on telefonitsi saadaval?";
			document.getElementById("buttonInEviction").innerHTML = "Võtan arvesse ja jätkan.";
		}
	} else if ((status === "victimAtHome") || ("victimReachable" === status)) {
		if (checkbox.checked === true) {
			document.getElementById("answer").innerHTML = 'Ohvri võib välja tõsta.';
		} else {
			document.getElementById("answer").innerHTML = 'Ohvrit ei või välja tõsta!';
		}
	} else {
		console.log(" 36: staatus on, aga miski muu: " + status);
		if (checkbox.checked) {
			status = 'victimReachable';
			document.getElementById("labelInEviction").innerHTML = "Ohver pole kodus, kuid on telefonitsi kättesaadav. Kas ta andis telefoniteel nõusoleku?";
			document.getElementById("buttonInEviction").innerHTML = "Kas võib ohvri välja tõsta?";
		} else {
			document.getElementById("answer").innerHTML = 'Ohvri võib välja tõsta';
		}
	}
}

/**
 * This function resets the calculation form so that we can perform a new
 * calculation from the beginning.
 * 
 * @author kalmer
 */
function resetCalculation() {
	status = "";
	document.getElementById("labelInEviction").innerHTML = "Kas ohver on kodus?";
	document.getElementById("buttonInEviction").innerHTML = "Võtan arvesse ja jätkan uurimist.";
	document.getElementById("answer").innerHTML = "";
}